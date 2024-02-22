let regions = sela('path');

regions.forEach(p => {
    p.on.hover(
        () => { p.class('selected'); p.unclass('cls-1'); },
        () => { p.class('cls-1'); p.unclass('selected'); }
    );
    p.on.click(() => {
        modal.show(p);
    });
});