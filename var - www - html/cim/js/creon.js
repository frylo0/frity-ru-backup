function select(selector, parent = undefined) { //, classes, parent, id, name
	function tagAutocomplete(elem, propertyWay) { //propertyWay => "prop1/prop2/prop3/.../propLast"
		let allTags = [
			"area", "base", "br", "col", "embed", "hr", "img", "input", "link", "menuitem", "meta", "param", "source", "track", "wbr", "script", "style", "textarea", "title", "a", "abbr", "address", "area", "map", "article", "aside", "audio", "b", "base", "bdi", "bdo", "blockquote", "body", "br", "button", "canvas", "caption", "table", "cite", "code", "col", "colgroup", "data", "datalist", "input", "option", "dd", "dt", "del", "details", "summary", "dfn", "dialog", "div", "dl", "dt", "em", "embed", "fieldset", "figcaption", "figure", "figure", "footer", "form", "h1-h6", "head", "title", "meta", "script", "link", "style", "header", "hr", "html", "i", "iframe", "img", "input", "ins", "kbd", "label", "input", "legend", "fieldset", "li", "link", "main", "main", "map", "area", "mark", "meta", "head", "meta", "meter", "nav", "noscript", "object", "param", "ol", "optgroup", "option", "option", "select", "optgroup", "datalist", "output", "p", "param", "object", "picture", "img", "source", "pre", "progress", "q", "ruby", "rb", "rt", "ruby", "rtc", "rp", "s", "samp", "script", "section", "select", "option", "small", "source", "picture", "video", "audio", "span", "strong", "style", "sub", "summary", "details", "sup", "table", "tbody", "td", "template", "textarea", "tfoot", "th", "thead", "time", "title", "tr", "track", "audio", "video", "u", "ul", "var", "video", "wbr"
		];
		let properties = propertyWay.split("/");
		let currentPosition = elem;
		properties.forEach(prop => {
			currentPosition = currentPosition[prop];
		});
		for (let i = 0, tagName; tagName = allTags[i]; i++) {
			currentPosition[tagName] = className => className ? currentPosition(tagName).class(className) : currentPosition(tagName);
		}
	}
	function frame(elem) {
		//TODO:
		//1. Сделать возможность выбора элементов по классу (например пропустить элементы с классом add-ingedient)
		//2. Добавить возможность пропуска родителей, то есть запись элементов на уровень выше (например помечать элементы, которые не будут принимать в себя детей а отдавать их родителю в структуре)
		//3. Добавить возможность ограничения множественного выделения детей по числу (например ingr$$5, значит что 5 детей будет записано как ingr0, ingr1, ingr2, ingr3, ingr4, а отсальные по последующей структуре)
		elem.destruct = function (to) {
			let toCopy = JSON.parse(JSON.stringify(to));
			to = this;
			let i = 0;
			for (let prop in toCopy) {
				let name = prop;
				if (name.endsWith("$$")) {
					let j = 0;
					let nowChild = to.firstchild;
					let prevChild;
					while (nowChild) {
						name = prop.slice(0, -2) + j;
						to[name] = nowChild.destruct(toCopy[prop]);
						j++;
						nowChild = nowChild.next();
					}
				} else {
					to[prop] = to.firstchild.next(i).destruct(toCopy[prop]);
				}
				i++;
			}
			return to;
		};

		elem.to = function (parent) {
			parent.appendChild(elem);
			return elem;
		};

		elem.class = function () {
			for (let i = 0; i < arguments.length; i++) {
				elem.classList.add(arguments[i]);
			}
			return elem;
		};
		elem.unclass = function () {
			for (let i = 0; i < arguments.length; i++) {
				if (elem.classList.contains(arguments[i])) {
					elem.classList.remove(arguments[i]);
				}
			}
			return elem;
		};
		elem.hasclass = function (className) {
			return elem.classList.contains(className);
		};

		elem.attr = function (attribute, value) {
			if (value !== undefined) {
				elem.setAttribute(attribute, value);
				return elem;
			} else {
				return elem.getAttribute(attribute);
			}
		};

		elem.textto = function (text) {
			elem.textContent = text;
			return elem;
		};
		elem.htmlto = function (html) {
			elem.innerHTML = html;
			return elem;
		};

		elem.parent = function (level) {
			level = level || 1;
			let currentParent = elem;
			for (let i = 0; i < level; i++) {
				currentParent = currentParent.parentElement;
			}
			let parent = currentParent;
			frame(parent);
			return parent;
		};

		elem.next = function (level) {
			if (level === 0 || level < 0) return elem;

			level = level || 1;

			let currentNextElement = elem;
			for (let i = 0; i < level; i++) {
				currentNextElement = currentNextElement.nextElementSibling;
			}
			if (currentNextElement)
				frame(currentNextElement);
			return currentNextElement;
		};
		elem.prev = function (level) {
			if (level === 0 || level < 0) return elem;

			level = level || 1;

			let currentPrevElement = elem;
			for (let i = 0; i < level; i++) {
				currentPrevElement = currentPrevElement.previousElementSibling;
			}
			if (currentPrevElement)
				frame(currentPrevElement);
			return currentPrevElement;
		};

		if (!elem.hasOwnProperty('firstchild') && !elem.hasOwnProperty('lastchild')) {
			Object.defineProperties(elem, {
				firstchild: {
					get: function () { return sel(elem.firstElementChild); },
					set: function (node) { return sel(elem.prepend(node)); },
				},
				lastchild: {
					get: function () { return sel(elem.lastElementChild); },
					set: function (node) { return sel(elem.append(node)); }
				}
			});
		}

		elem.push = function (child, numberOfChilds) {
			if (numberOfChilds) {
				let newchildren = create(child, numberOfChilds);
				newchildren.forEach(childelem => childelem.to(elem));
				return newchildren;
			}
			else {
				return create(child).to(elem);
			}
		};
		tagAutocomplete(elem, "push");

		elem.insert = {};
		elem.insert.after = function (child) {
			return elem.parent().insertBefore(create(child), elem.next());
		};
		tagAutocomplete(elem, "insert/after");
		elem.insert.before = function (child) {
			return elem.parent().insertBefore(create(child), elem);
		};
		tagAutocomplete(elem, "insert/before");

		elem.clone = function (isDeepCloning) {
			isDeepCloning = isDeepCloning || true;
			return document.body.cloneNode(isDeepCloning);
		};

		elem.lettering = function () {
			let text = elem.textContent.trim().split("");
			let newHTML = "";
			for (let i = 0; i < text.length; i++) {
				const letter = text[i];
				newHTML += '<span>' + letter + '</span>';
			}
			elem.htmlto(newHTML);
			return elem.children;
		};

		elem.select = function (selector) { return select(selector, elem); };
		elem.selectAll = function (selector) { return selectAll(selector, elem); };

		elem.sel = function (selector) { return sel(selector, elem); };
		elem.sela = function (selector) { return sela(selector, elem); };


		elem.events = {};

		elem.on = function (eventTypes, handler, name = "") {
			let eventTypesArray = eventTypes.split(" ");
			for (let i = 0; i < eventTypesArray.length; i++) {
				let eName = eventTypesArray[i].trim(); //eventName
				elem.addEventListener(eName, handler);
				if (!elem.events[eName]) {
					elem.events[eName] = [];
					elem.events[eName].remove = function () {
						for (let child in elem.events[eName]) {
							elem.events[eName][child].remove();
						}
						delete elem.events[eName];
					}
					Object.defineProperty(elem.events[eName], "remove", { enumerable: false });
				}
				if (name == "") {
					let index = elem.events[eName].push(handler) - 1;
					let currEvent = elem.events[eName][index];
					currEvent.eventtype = {};
					currEvent.eventtype.link = elem.events[eName];
					currEvent.eventtype.name = eName;
					currEvent.remove = () => {
						elem.removeEventListener(currEvent.eventtype.name, currEvent);
					};
				} else {
					let currEvent = elem.events[eName][name];
					currEvent = handler;
					currEvent.eventtype = {};
					currEvent.eventtype.link = elem.events[eName];
					currEvent.eventtype.name = eName;
					currEvent.remove = () => {
						elem.removeEventListener(currEvent.eventtype.name, currEvent);
					};
				}
			}
			return elem;
		};

		elem.on.hover = function (hoverin, hoverout, name = "") {
			if (hoverout) {
				elem.on("mouseenter", hoverin, name).on("mouseleave", hoverout, name);
			}
			else {
				elem.on("mouseenter", e => {
					if (!elem.on.hover.stylesBefore)
						elem.on.hover.stylesBefore = elem.style.cssText;
					hoverin(e);
				}, name);
				elem.on("mouseleave", e => {
					if (elem.on.hover.stylesBefore) {
						elem.style.cssText = elem.on.hover.stylesBefore;
						delete elem.on.hover.stylesBefore;
					}
				}, name);
			}
			return elem;
		};
		elem.on.click = function (handler) {
			elem.on("click", handler);
			return elem;
		};
		elem.on.focus = function (focusin, focusout) {
			elem.on("focusin", focusin).on("focusout", focusout);
			return elem;
		};
		elem.on.change = function (handler) {
			elem.on("change", handler);
			return elem;
		};

		for (let styleProp in elem.style) {
			elem.on.hover[styleProp] = function (value) {
				elem.on.hover(() => elem.style[styleProp] = value, undefined, styleProp);
				return elem;
			};
			elem.on.hover[styleProp].remove = function () {
				if (elem.events.mouseenter[styleProp])
					elem.events.mouseenter[styleProp].remove();
				if (elem.events.mouseleave[styleProp])
					elem.events.mouseleave[styleProp].remove();
			};
		};

		elem.style.few = function (fewStylesObject) {
			for (let prop in fewStylesObject) {
				elem.style[prop] = fewStylesObject[prop];
			}
			return elem;
		};
	}


	let elem;
	if (typeof selector == "string")
		if (parent) {
			elem = parent.querySelector(selector);
		} else {
			elem = document.querySelector(selector);
		}
	else
		elem = selector;
	if (elem) frame(elem);
	return elem;
}
select.page = function () {
	selectAll("*");
}
function selectAll(selector, parent) {
	let elems;
	if (typeof selector == "string")
		if (parent) {
			elems = parent.querySelectorAll(selector);
		} else {
			elems = document.querySelectorAll(selector);
		}
	else { //if selector is array of elements
		elems = [];
		for (let i = 0; i < selector.length; i++) {
			elems.push(selector[i]);
		}
	}
	elems.forEach(elem => select(elem));
	
	elems.each = function (eachProccesingFunction) {
		for (let i = 0; i < elems.length; i++) {
			const el = elems[i];
			eachProccesingFunction.bind(el)(el, i, elems);
		}
	};
	return elems;
}


function create(tag, numberOfElements) {
	if (numberOfElements) {
		let elems = [];
		for (let i = 0; i < numberOfElements; i++) {
			let elem = document.createElement(tag);
			elems.push(select(elem));
		}
		return elems;
	}
	else {
		let elem = document.createElement(tag);
		select(elem);
		return elem;
	}
}
(function () {
	let allTags = [
		"area", "base", "br", "col", "embed", "hr", "img", "input", "link", "menuitem", "meta", "param", "source", "track", "wbr", "script", "style", "textarea", "title", "a", "abbr", "address", "area", "map", "article", "aside", "audio", "b", "base", "bdi", "bdo", "blockquote", "body", "br", "button", "canvas", "caption", "table", "cite", "code", "col", "colgroup", "data", "datalist", "input", "option", "dd", "dt", "del", "details", "summary", "dfn", "dialog", "div", "dl", "dt", "em", "embed", "fieldset", "figcaption", "figure", "figure", "footer", "form", "h1-h6", "head", "title", "meta", "script", "link", "style", "header", "hr", "html", "i", "iframe", "img", "input", "ins", "kbd", "label", "input", "legend", "fieldset", "li", "link", "main", "main", "map", "area", "mark", "meta", "head", "meta", "meter", "nav", "noscript", "object", "param", "ol", "optgroup", "option", "option", "select", "optgroup", "datalist", "output", "p", "param", "object", "picture", "img", "source", "pre", "progress", "q", "ruby", "rb", "rt", "ruby", "rtc", "rp", "s", "samp", "script", "section", "select", "option", "small", "source", "picture", "video", "audio", "span", "strong", "style", "sub", "summary", "details", "sup", "table", "tbody", "td", "template", "textarea", "tfoot", "th", "thead", "time", "title", "tr", "track", "audio", "video", "u", "ul", "var", "video", "wbr"
	];
	for (let i = 0, tagName; tagName = allTags[i]; i++) {
		create[tagName] = className => className ? create(tagName).class(className) : create(tagName);
	}
}());



function jeson(data, separator = "<::>") {
	let jesoner = {};

	jesoner.get = get;
	jesoner.remove = remove;

	function remove(targetString) {
		let way = targetString.split(separator);
		let now = data;
		for (let i = 0; i < way.length - 1; i++) {
			if (now[way[i]])
				now = now[way[i]];
			else return null;
		}
		delete now[way[way.length - 1]];
	}
	function get(targetString) {
		let way = targetString.split(separator);
		let now = data;
		for (let i = 0; i < way.length; i++) {
			if (now[way[i]])
				now = now[way[i]];
			else return null;
		}
		now.get = get;
		return now;
	}

	return jesoner;
}

let sel = select;
let sela = selectAll;
let cre = create;

create.post = function (url, name = "") {
	let post = new XMLHttpRequest();
	post.open("post", url, true);
	post.ok = function () { };
	post.err = function () { };
	post.onreadystatechange = function () {
		if (post.readyState != 4) return;
		if (post.status == 200)
			post.ok(post);
		else
			post.err(post);
	};
	if (name == "")
		cre.post.arr.push(post);
	else
		cre.post.arr[name] = post;
	return post;
};
create.post.arr = [];
select.post = function (name) {
	return cre.post.arr[name];
};

create.get = function (url, name = "") {
	let get = new XMLHttpRequest();
	get.open("get", url, true);
	get.ok = function () { };
	get.err = function () { };
	get.onreadystatechange = function () {
		if (get.readyState != 4) return;
		if (get.status == 200)
			get.ok(get);
		else
			get.err(get);
	};
	if (name == "")
		cre.get.arr.push(get);
	else
		cre.get.arr[name] = get;
	return get;
};
select.get = function (name) {
	return cre.get.arr[name];
};

function range(n) {
    return {
        from: 0, to: n, [Symbol.iterator]() {return this;},next() {
            if (this.current === undefined) {
              this.current = this.from;
            }
            if (this.current < this.to) {
              return {
                done: false,
                value: this.current++
              };
            } else {
              delete this.current;
              return {
                done: true
              };
            }
        }
    };
}

let keycode = {
	a: 65,
	b: 66,
	c: 67,
	d: 68,
	e: 69,
	f: 70,
	g: 71,
	h: 72,
	i: 73,
	j: 74,
	k: 75,
	l: 76,
	m: 77,
	n: 78,
	o: 79,
	p: 80,
	q: 81,
	r: 82,
	s: 83,
	t: 84,
	u: 85,
	v: 86,
	w: 87,
	x: 88,
	y: 89,
	z: 90,

	backspace: 8,
	tab: 9,
	clear: 12,
	enter: 13,
	shift: 16,
	ctrl: 17,
	alt: 18,
	pause: 19,
	capsLock: 20,
	ecsape: 27,
	space: 32,
	end: 35,
	home: 36,
	arrow: {
		left: 37,
		up: 38,
		right: 39,
		down: 40
	},
	select: 41,
	print: 42,
	execute: 43,
	printScreen: 44,
	insert: 45,
	help: 47,
	delete: 46,
	colon: 58,
	semicolon: 59,
	less: 60,
	windows: {
		left: 91,
		right: 92
	},
	command: {
		left: 91,
		right: 92
	},
	sleep: 95,
	numpad0: 96,
	numpad1: 97,
	numpad2: 98,
	numpad3: 99,
	numpad4: 100,
	numpad5: 101,
	numpad6: 102,
	numpad7: 103,
	numpad8: 104,
	numpad9: 105,
	multiply: 106,
	add: 107,
	subtract: 109,
	decimalPoint: 110,
	divide: 111,
	numLock: 144,
	scrollLock: 145,
	caret: 160,
	exclamationMark: 161,
	sharp: 163,
	dollar: 164,
	page: {
		backward: 166,
		forward: 167,
		refresh: 168,
		up: 33,
		down: 34
	},
	email: 180,
	equal: 187,
	comma: 188,
	dash: 189,
	period: 190,
	slash: 191,
	backquote: 192,
	bracketLeft: 219,
	backslash: 220,
	bracketRight: 221,
	singleQuote: 222,

	digit0: 48,
	digit1: 49,
	digit2: 50,
	digit3: 51,
	digit4: 52,
	digit5: 53,
	digit6: 54,
	digit7: 55,
	digit8: 56,
	digit9: 57,

	F1: 112,
	F2: 113,
	F3: 114,
	F4: 115,
	F5: 116,
	F6: 117,
	F7: 118,
	F8: 119,
	F9: 120,
	F10: 121,
	F11: 122,
	F12: 123,
	F13: 124,
	F14: 125,
	F15: 126,
	F16: 127,
	F17: 128,
	F18: 129,
	F19: 130,
	F20: 131,
	F21: 132,
	F22: 133,
	F23: 134,
	F24: 135
};