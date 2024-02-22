import cardHandle from './api/card.js';

$(document).ready(async () => {
  let main = $('body > main'),
    search = $('#search-input'),
    cards = $('.card');

  cards.each(function () {
    cardHandle($(this));
  });

  tippy('.card__is-mobile', { content: 'Доступна мобильная версия' });
  tippy('.card__is-pc', { content: 'Доступна версия для ПК' });
  tippy('.card__has-maintain', { content: 'Проект поддерживается' });
  tippy('[data-tippy-content]');

  function rand(min, max) {
    return Math.random() * (max - min) + min;
  }

  let keyupTimeout = 0;
  search.keyup(e => {
    clearTimeout(keyupTimeout);

    let x = rand(-10, 10), y = rand(-10, 10);

    search.css({
      boxShadow: `${x}px ${y}px 0px white`,
    });

    keyupTimeout = setTimeout(() => {
      $('.card-wrapper').each(function () {
        const title = $('.card__title', this);
        const link = $('.card', this).attr('href');
        const text = title.text();
        const regex = new RegExp(`.*${search.val()}.*`, 'i');

        const isMatch = text.match(regex) || link.match(regex);

        $(this).css('display', isMatch ? '' : 'none');
      });
    }, 0);
  });
});
