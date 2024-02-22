export default function cardHandle(card) {
  let events = {
    hover: {
      in: e => card.addClass('card_hover'),
      out: e => card.removeClass('card_hover'),
      on: () => {
        card[0].addEventListener('mouseenter', events.hover.in);
        card[0].addEventListener('mouseleave', events.hover.out);
      },
      off: () => {
        card[0].removeEventListener('mouseenter', events.hover.in);
        card[0].removeEventListener('mouseleave', events.hover.out);
      },
    },
    click: {
      click: e => {
        if (!card.hasClass('card_hover')) {
          card.addClass('card_hover');
          e.preventDefault();
          setTimeout(() => card.removeClass('card_hover'), 2000);
        }
      },
      on: () => card[0].addEventListener('click', events.click.click),
      off: () => card[0].removeEventListener('click', events.click.click),
    }
  };

  function handle() {
    events.click.off();
    events.hover.off();
    if (screen.height <= 600 && screen.width <= 800)
      events.click.on();
    else
      events.hover.on();
  }

  handle();

  $(window).resize(() => handle());
}
