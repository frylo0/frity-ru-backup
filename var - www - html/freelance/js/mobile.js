sel('.mainpage').style.transform = 'scale(0.9, 0.95)';
let wrapper = sel(".wrapper");

let molecule = {
    purple: sel('.feodoritiy-model_part.purple'),
    red: sel('.feodoritiy-model_part.red'),
    yellow: sel('.feodoritiy-model_part.yellow'),
    green: sel('.feodoritiy-model_part.green'),
    sky: sel('.feodoritiy-model_part.sky'),
    blue: sel('.feodoritiy-model_part.blue'),
    purpleHoverable: sel('.feodoritiy-model_part.purple.hoverable'),
    redHoverable: sel('.feodoritiy-model_part.red.hoverable'),
    yellowHoverable: sel('.feodoritiy-model_part.yellow.hoverable'),
    greenHoverable: sel('.feodoritiy-model_part.green.hoverable'),
    skyHoverable: sel('.feodoritiy-model_part.sky.hoverable'),
    blueHoverable: sel('.feodoritiy-model_part.blue.hoverable')
};

function showFeodoritiyPartText(part, hoverPart, linkedSection, anglePerLetter = 3, reverseMode = false) {

    hoverPart.on.click(() => {
        currScrollSectionIndex = sections.indexOf(linkedSection);
        isResponseOnTouch = false;
        scrollToTarget(wrapper, { left: linkedSection.offsetLeft - 16 * 2, behavior: "smooth" })
            .then(() => isResponseOnTouch = true);
    });
}
showFeodoritiyPartText(molecule.red, molecule.redHoverable, sel('.design'), 10);
showFeodoritiyPartText(molecule.purple, molecule.purpleHoverable, sel('.adaptivity'), 10);
showFeodoritiyPartText(molecule.yellow, molecule.yellowHoverable, sel('.speed'), 10);
showFeodoritiyPartText(molecule.green, molecule.greenHoverable, sel('.creationsteps'), 10, true);
showFeodoritiyPartText(molecule.sky, molecule.skyHoverable, sel('.static'), 10, true);
showFeodoritiyPartText(molecule.blue, molecule.blueHoverable, sel('.order'), 10, true);

sel("#scrollToExamplesButton").on.click(() => {
    currScrollSectionIndex = sections.length - 1;
    isResponseOnTouch = false;
    scrollToTarget(wrapper, { left: sel('.examples').offsetLeft - 16 * 2, behavior: "smooth" })
        .then(() => isResponseOnTouch = true);
});

sela('.mobile-change-fill').forEach(el => el.style.few({ fill: 'none', stroke: '#ffffffee' }));


// swipe events
let sections = [sel('.mainpage'), sel('.adaptivity'), sel('.design'), sel('.speed'), sel('.creationsteps'), sel('.static'), sel('.order'), sel('.examples')];
let currScrollSectionIndex = 0;
for (let i = 0; i < sections.length; i++) {
    if (wrapper.pageXOffset >= sections[i].offsetLeft) break;
    else currScrpageYOffsetnIndex = i;
}
//FIXME: масштабирование страницы не работает
let prevTouch = null, currTouch = null, touchesCount, swipeMoveAxis = null;
wrapper.on('touchstart', e => currTouch = prevTouch = e.touches[0]);
wrapper.on('touchmove', e => {
    const deltaAbs = {
        x: Math.abs(currTouch.screenX - e.touches[0].screenX),
        y: Math.abs(currTouch.screenY - e.touches[0].screenY)
    };
    if (deltaAbs.x > deltaAbs.y) {//if x > 1 in fraction
        e.preventDefault();
        swipeMoveAxis = 'horisontal';
    } else swipeMoveAxis = 'vertical';
    currTouch = e.touches[0];
    touchesCount = e.touches.length;
}, { passive: false });
wrapper.on('touchend', touchEndHandler);

let swipeMinLengthTwice = 10 / 2, isResponseOnTouch = true;
function touchEndHandler(e) {
    if (!isResponseOnTouch && touchesCount > 1) return; //if is scroll now don't react

    let isTouchMove = !(prevTouch.screenX - swipeMinLengthTwice <= currTouch.screenX && currTouch.screenX <= prevTouch.screenX + swipeMinLengthTwice);
    if (!isTouchMove || swipeMoveAxis == 'vertical') return;

    let isMoveRight = !(prevTouch.screenX < currTouch.screenX), //not, because touch has inverted direction
        notFirstSection = currScrollSectionIndex > 0,
        notLastSection = currScrollSectionIndex < sections.length - 1;

    //scroll right
    if (isMoveRight && notLastSection) {
        currScrollSectionIndex++;
    } else if (notFirstSection) { //scroll left
        currScrollSectionIndex--;
    } else throw new Error('Section out of bounds in Scroll Handler'); //error in scrolling

    isResponseOnTouch = false;
    let scrollLeft = sections[currScrollSectionIndex].offsetLeft - 16 * 2 > 0 ? sections[currScrollSectionIndex].offsetLeft - 16 * 2 : 0;
    scrollToTarget(wrapper, { top: 0, left: scrollLeft, behavior: 'smooth' })
        .then(() => isResponseOnTouch = true);
}

/**
 * Native scrollTo with promise
 * @param target - scroll target, default is window
 * @param settings - scroll settings
 */
function scrollToTarget(target = window, settings) {
    return new Promise((resolve, reject) => {
        settings.top = settings.top || 0;
        settings.left = settings.left || 0;
        const onScroll = function () {
            if (target != window) {
                if (target.scrollLeft == settings.left &&
                    target.scrollTop == settings.top) {
                    target.removeEventListener('scroll', onScroll);
                    resolve();
                }
            } else {
                if (target.pageXOffset == settings.left &&
                    target.pageYOffset == settings.top) {
                    target.removeEventListener('scroll', onScroll);
                    resolve();
                }
            }
        }
        target.addEventListener('scroll', onScroll);
        onScroll();
        target.scrollTo(settings);
    });
}