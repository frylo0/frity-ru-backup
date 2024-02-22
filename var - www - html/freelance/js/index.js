if (screen.width < 800) {
    cre.script().attr('src', 'js/mobile.js?v0.000021').to(document.body);
} else {
    cre.script().attr('src', 'js/pc.js?v0.000001').to(document.body);
}