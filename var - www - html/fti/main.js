import { list, listRaw } from './list.js?ver=1.41';
import { modes } from './modes.js?ver=1.41';
import { scheduleLinks } from './schedule-links.js?ver=1.41';

function selectYouself() {
  cre('h2', {
    textContent: 'Выбери себя в списке:',
  });

  let search = cre('input', {
    onkeyup(e) {
      let regexp = new RegExp(e.target.value, 'i');
      console.log(regexp);
      setTimeout(() => {
        lis.forEach(li => {
          if (li.textContent.match(regexp))
            li.style = '';
          else
            li.style = 'height: 0; overflow: visible hidden;';
        });
      });
    },
    placeholder: 'Введи свою фамилию...',
  });

  cre('button', { innerHTML: 'Список девочек', onclick() { search.value = '\\*'; search.run(); } });
  cre('button', { innerHTML: 'Список мальчиков', onclick() { search.value = '[^\\*]\\(...\\)$'; search.run(); } });
  cre('button', { innerHTML: 'Очистить', onclick() { search.value = ''; search.run(); }, style: 'border: none; background: none;' });

  // creating list of all students
  let ol = cre('ol'), lis = [];
  for (let i = 0, person; person = list[i]; i++) {
    let li = cre('li', {}, ol);
    cre('a', { innerHTML: `<span>${person}</span>`, href: `./?id=${i}&mode=${modes[0]}` }, li);
    cre('small', { textContent: `(${listRaw[i][0]})`, style: 'margin-left: 0.5em; color: lightgray' }, li);
    lis.push(li);
  }

  // dispatching key event to search input
  search.run = function () {
    var keyboardEvent = document.createEvent("KeyboardEvent");
    var initMethod = typeof keyboardEvent.initKeyboardEvent !== 'undefined' ? "initKeyboardEvent" : "initKeyEvent";

    keyboardEvent[initMethod](
      "keyup", // event type: keydown, keyup, keypress
      true,      // bubbles
      true,      // cancelable
      window,    // view: should be window
      false,     // ctrlKey
      false,     // altKey
      false,     // shiftKey
      false,     // metaKey
      40,        // keyCode: unsigned long - the virtual key code, else 0
      0          // charCode: unsigned long - the Unicode character associated with the depressed key, else 0
    );
    this.dispatchEvent(keyboardEvent);
  };
}

function createGroupTypes(urlParams) {
  const id = urlParams.get('id'); // getting curr id from get-query

  cre('h2', {
    innerHTML: `Ты вошёл(-ла) как <span class="t-purple">${list[id]}</span>`,
  });

  let modesBlock = cre('div', {
    className: 'modes',
  });

  cre('p', { textContent: 'Выбери количество людей в группах, по которому формировать список:', style: 'margin-bottom: 0;' }, modesBlock);

  let currMode = urlParams.get('mode'); // getting selected mode from get-query if it exists
  for (let mode of modes) { // listing all modes as buttons
    urlParams.set('mode', mode);
    cre('a', {
      href: '?' + urlParams.toString(), // generating link with get-query for this mode
      innerHTML: `<button style="color: inherit">${mode}</button>`,
      style: `color: ${mode == currMode ? 'blue' : 'black'}`, // blue color for curr mode
    }, modesBlock);
  }

  urlParams.set('mode', currMode); // reverting mode to curr

  if (currMode) createTargetInfo(urlParams); // if was selected any mode then taking info

  cre('a', { href: './', innerHTML: '&larr; Назад', style: 'text-decoration: none' });
}

async function createTargetInfo(urlParams) {
  let modeNums = urlParams.get('mode').split('-').map(n => +n), // splitting mode to numbers
    id = +urlParams.get('id'); // getting id from get-query

  if (id >= 70) {
    cre('p', { textContent: 'Ты в самой последней группе и для тебя расписания пока нет (((' });
    return;
  }

  let range = { start: '', middle: '', end: '' }, groupId = null;

  // searching for target group in curr mode
  for (let i = 0, sum = 0, modeNum; modeNum = modeNums[i]; i++) {
    if (id < sum + modeNum) { // if we are in target group
      // then save this state to variables
      range.start = sum; range.end = sum + modeNum;
      range.middle = (range.end - range.start) / 2;
      groupId = i;
      break;
    } else
      sum += modeNum; // else continue searching
  }

  // transform middle to abs value
  range.middle += range.start;

  // generating subgroup number by middle of range
  let subgroupNum = (id > range.middle) + 1, subgroupId = (groupId + 1) + '' + subgroupNum;

  let subgroupTitle = cre('h2', { innerHTML: 'Твоя <span class="t-blue">подгруппа</span>: ' + 'ПИ-б-о-20' + (groupId + 1) + `(${subgroupNum})` + ('' && `, ${subgroupId}`) + ', ' });
  cre('a', {
    innerHTML: groupId + 1 == 3 ? '<button disabled>расписания для 3 группы нет</button>' : '<button>расписание</button>',
    href: scheduleLinks[subgroupId], target: '_blank',
  }, subgroupTitle);

  let ol = cre('ol', { style: `counter-increment: li ${range.start};` });

  // some updates to range values
  range.curr = range.start;
  // for each person in this range
  for (let person of list.slice(range.start, range.end)) {
    // logic to detect my self and me subgroup siblings (red || blue || black - colors)
    let mode = range.curr == id
      ? 'me'
      : (range.curr < range.middle
        ? (id < range.middle
          ? 'subgroup'
          : 'usual')
        : (id > range.middle
          ? 'subgroup'
          : 'usual'));
    cre('li', { innerHTML: `<span>${person}</span>`, className: mode }, ol);
    range.curr++;
  }
}

async function main() {
  let urlParams = new URLSearchParams(location.search);
  console.log(urlParams);
  if (Array.from(urlParams.keys()).length == 0)
    selectYouself();
  else
    createGroupTypes(urlParams);
}

main();

function cre(tag, conf, parent = document.body) {
  let el = document.createElement(tag);
  config(el, conf);
  parent.append(el);
  return el;
}
function config(el, conf) {
  for (let prop in conf)
    el[prop] = conf[prop];
}