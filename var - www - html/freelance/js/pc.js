let mainPage = sel('.mainpage');
let adaptivityPage = sel(".adaptivity");
let designPage = sel('.design');
let speedPage = sel(".speed");
let creationSteps = sel(".creationsteps");
let staticPage = sel('.static');
let orderPage = sel('.order');
let examplesPage = sel('.examples');

//rotate feodoritiy logo
anime({
	targets: '.core-small',
	rotate: [-180, 180],
	direction: 'normal',
	duration: 2000,
	loop: true,
	easing: 'easeInOutSine'
});

//letters of selected text in SPANs
let weAreTeamLetters = sel(".feodoritiy-description .description span").lettering();

//wave animation of text
function weAreTeamLettersRandom() {
	anime({
		targets: weAreTeamLetters,
		delay: anime.stagger(30), //make some delay for each letter
		translateY: [
			{
				duration: 200, //go down
				value: '-0.5em',
				easing: 'easeOutSine'
			},
			{
				duration: 200,
				value: '0.5em', //go up
				easing: 'easeOutSine'
			},
			{
				duration: 100,
				value: '0em' //go back
			}
		],
		easing: 'linear',
		loop: false,
		endDelay: 500 //for wait after animation
	});
	setTimeout(weAreTeamLettersRandom, Math.random() * 7000); //random interval (0, 7000)
}
weAreTeamLettersRandom();

//text attracting to cursor
let attentionOfPeople = sel(".feodoritiy-description .attentionOfPeople").lettering();
mainPage.overscrolled = true;
mainPage.on.click(() => {
	event.stopPropagation();
	window.scrollTo({ top: mainPage.offsetTop, behavior: 'smooth' });
});
mainPage.on('mousemove', e => {
	for (let i = 0; i < attentionOfPeople.length; i++) {
		let letter = attentionOfPeople[i];
		let maxShift = 12;
		let isPositive = {
			x: e.x - letter.offsetLeft >= 0,
			y: e.y + window.pageYOffset - letter.offsetTop >= 0
		};
		let range = {
			x: Math.abs(e.x - letter.offsetLeft),
			y: Math.abs(e.y + window.pageYOffset - letter.offsetTop)
		};
		let distanceToCursore = Math.sqrt(range.x * range.x + range.y * range.y);
		let calculatedPercents = maxShift / distanceToCursore;
		let normalizedPercents = (calculatedPercents > 1) ? 1 : calculatedPercents * calculatedPercents;
		let shift = {
			x: range.x * normalizedPercents * ((isPositive.x) ? 1 : -1),
			y: range.y * normalizedPercents * ((isPositive.y) ? 1 : -1)
		};
		letter.style.transform = `translate(${shift.x}px, ${shift.y}px`;
	}
});

//design page white blocks
let fireFrame = sel('.design .picture .spawner');
designPage.cursore = {
	isPositive: {
		x: true,
		y: true
	},
	range: {
		x: 0,
		y: 300
	},
	shift: {
		x: 0,
		y: 300
	}
};
designPage.on('mousemove', e => {
	designPage.cursore.isPositive = {
		x: e.x - (fireFrame.offsetLeft + fireFrame.parent().offsetWidth) >= 0,
		y: e.y - fireFrame.offsetTop >= 0
	};
	designPage.cursore.range = {
		x: Math.abs(e.x - (fireFrame.offsetLeft + fireFrame.parent().offsetWidth)),
		y: Math.abs(e.y - fireFrame.offsetTop)
	};
	designPage.cursore.shift = {
		x: designPage.cursore.range.x * ((designPage.cursore.isPositive.x) ? -1 : 1),
		y: designPage.cursore.range.y * ((designPage.cursore.isPositive.y) ? -1 : 1)
	};
});
fireFrame.fire = {
	size: {
		y: 10,
		particle: {
			endScale: 0.1
		}
	},
	color: {
		end: '#f20d0d'
	},
	deltaTime: {
		min: 5,
		max: 20
	}
};
fireFrame.createAndAnimateParticle = function () {
	function createParticle() {
		let particleFrame = cre.div('particle-frame').to(fireFrame);
		let particle = cre.div('particle').to(particleFrame);
		return particleFrame;
	}

	function animateParticle(block) {
		anime({
			targets: block,
			translateX: designPage.cursore.shift.x,
			//-1 * fireFrame.fire.size.y + 'em'
			translateY: designPage.cursore.shift.y,
			duration: 2500,
			scale: fireFrame.fire.size.particle.endScale,
			easing: 'easeOutQuad',
			complete: () => block.remove()
		});
		anime({
			targets: block.firstchild,
			backgroundColor: fireFrame.fire.color.end,
			opacity: 0.9,
			duration: 1500,
			easing: 'easeOutQuad'
		})
	}

	animateParticle(createParticle());
};

fireFrame.doFlame = function () {
	if (fireFrame.continue)
		setTimeout(() => {
			fireFrame.createAndAnimateParticle();
			fireFrame.doFlame()
		}, anime.random(fireFrame.fire.deltaTime.min, fireFrame.fire.deltaTime.max));
};

fireFrame.continue = true;
fireFrame.startFlame = function () {
	if (!fireFrame.continue) {
		fireFrame.continue = true;
		fireFrame.doFlame();
	}
};
fireFrame.startFlame();

fireFrame.stopFlame = function () {
	fireFrame.continue = false;
};

//change color of design list
let listElements = sela('.design .description .list span');
setInterval(() => {
	listElements.forEach(li => {
		anime({
			targets: li,
			easing: 'linear',
			color: () => randomColorBetween('#ffffff', '#ff9999'),
			duration: 500,
		});
	});
}, 1000);

function randomColorBetween(color1, color2) {
	let col1 = { r: 0, g: 0, b: 0 };
	let col2 = { r: 0, g: 0, b: 0 };
	col1.r = parseInt(color1[1] + color1[2], 16);
	col1.g = parseInt(color1[3] + color1[4], 16);
	col1.b = parseInt(color1[5] + color1[6], 16);
	col2.r = parseInt(color2[1] + color2[2], 16);
	col2.g = parseInt(color2[3] + color2[4], 16);
	col2.b = parseInt(color2[5] + color2[6], 16);
	let randomPerc = anime.random(0, 100) / 100;
	final = {
		r: (col1.r < col2.r) ? col1.r + (col2.r - col1.r) * randomPerc : col2.r + (col1.r - col2.r) * randomPerc,
		g: (col1.g < col2.g) ? col1.g + (col2.g - col1.g) * randomPerc : col2.g + (col1.g - col2.g) * randomPerc,
		b: (col1.b < col2.b) ? col1.b + (col2.b - col1.b) * randomPerc : col2.b + (col1.b - col2.b) * randomPerc
	};

	return '#' + Math.round(final.r).toString(16) + Math.round(final.g).toString(16) + Math.round(final.b).toString(16);
}

designPage.clickHandler = () => {
	anime({
		targets: '.design .list span',
		delay: anime.stagger(100),
		opacity: [0, 1],
		translateX: [100, 0],
		translateY: [0, 0],
		easing: 'easeInOutSine',
	});
	fireFrame.startFlame();
};
designPage.hoverOutHandler = () => {
	anime({
		targets: '.design .list span',
		delay: anime.stagger(100),
		opacity: [1, 0],
		translateY: [0, -100],
		easing: 'easeInOutSine',
	});
	fireFrame.stopFlame();
};
designPage.hoverOutHandler();

function isNowHasOverscroll(section) {
	return section.offsetTop < window.scrollY + screen.height * 0.33;
}

function isOverscrollStateChanged(section) {
	//if become overscrolled
	if (isNowHasOverscroll(section) && !section.overscrolled) {
		return 'become overscrolled';
	}
	//if become UNoverscrolled
	else if (!isNowHasOverscroll(section) && section.overscrolled) {
		return 'stop be overscrolled';
	}
}

window.scrollSection = 0;
let sections = [mainPage, adaptivityPage, designPage, speedPage, creationSteps, staticPage, orderPage, examplesPage];
sections.forEach(section => section.overscrolled = false);

//first sections setup on load
let prevScrollPosition = window.scrollY;
for (let i = 1; i < sections.length; i++) {
	const section = sections[i];

	let isNeedAnimation = isNowHasOverscroll;

	if (isNeedAnimation(section)) {
		section.unclass("section_pop");
		if (section.clickHandler) section.clickHandler();
		window.scrollSection = i;
		section.overscrolled = true;
	}
	else break; //when break||end the scrollSection is detected
}

window.addEventListener("scroll", () => windowPCScrollHandler()); //STOP: scroll listener

function windowPCScrollHandler() {
	let isScrollDown = window.scrollY > prevScrollPosition;
	prevScrollPosition = window.scrollY;

	if (isScrollDown) {
		for (let i = window.scrollSection; i < sections.length; i++) {
			const section = sections[i];
			let overscrolledStateChanged = isOverscrollStateChanged(section);
			if (overscrolledStateChanged == 'become overscrolled') {
				section.unclass("section_pop");
				section.unclass("section_hover");
				if (section.clickHandler) section.clickHandler();
				if (section.onOverscrollIn) section.onOverscrollIn();
				window.scrollSection = i;
				section.overscrolled = true;
				break;
			}
		}
	}
	else {
		for (let i = window.scrollSection; i > -1; i--) {
			const section = sections[i];
			let overscrolledStateChanged = isOverscrollStateChanged(section);
			if (overscrolledStateChanged == 'stop be overscrolled') {
				section.class("section_pop");
				if (section.hoverOutHandler) section.hoverOutHandler();
				if (section.onOverscrollOut) section.onOverscrollOut();
				window.scrollSection = (i - 1 < 0) ? 0 : i - 1;
				section.overscrolled = false;
				break;
			}
		}
	}
	if (window.scrollTimeout) clearTimeout(window.scrollTimeout);
	window.scrollTimeout = setTimeout(() => window.scrollTo({ top: sections[window.scrollSection].offsetTop, behavior: "smooth" }), 5000);

	// console.log(`isScrollDown: ${isScrollDown}; window.scrollSection: ${window.scrollSection}
	// sections[0]: ${sections[0].overscrolled};
	// sections[1]: ${sections[1].overscrolled};
	// sections[2]: ${sections[2].overscrolled};
	// sections[3]: ${sections[3].overscrolled};
	// sections[4]: ${sections[4].overscrolled};
	// sections[5]: ${sections[5].overscrolled};
	// sections[6]: ${sections[6].overscrolled};`);
}



//arc letters on feodoritiy logo on main page
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

molecule.red.letters = molecule.red.lettering();
molecule.purple.letters = molecule.purple.lettering();
molecule.yellow.letters = molecule.yellow.lettering();
molecule.green.letters = molecule.green.lettering();
molecule.sky.letters = molecule.sky.lettering();
molecule.blue.letters = molecule.blue.lettering();

//handle hoverIn hoverOut click events for recieved molecule part
function handleFeodoritiyPartText(part, hoverPart, anglePerLetter = 3, reverseMode = false) {
	let halfAngleForAllLetters = part.letters.length * anglePerLetter / 2;
	anime({
		targets: part.letters,
		rotate: anime.stagger([-halfAngleForAllLetters * (reverseMode ? -1 : 1), halfAngleForAllLetters * (reverseMode ? -1 : 1)], { start: -halfAngleForAllLetters * (reverseMode ? -1 : 1) }),
		easing: 'easeInOutSine',
		height: ['9em', '9em'],
		opacity: [0, 0],
		delay: anime.stagger(50),
		duration: 300
	});
	let handlers = {
		hoverIn: () => {
			anime({
				targets: part.letters,
				rotate: anime.stagger([-halfAngleForAllLetters * (reverseMode ? -1 : 1), halfAngleForAllLetters * (reverseMode ? -1 : 1)], { start: -halfAngleForAllLetters * (reverseMode ? -1 : 1) }),
				easing: 'easeInOutSine',
				height: ['9.25em', '9.25em'],
				opacity: [0, 1],
				delay: anime.stagger(50),
				duration: 300,
				complete: () => state = 'shown'
			});
		},
		hoverOut: () => {
			anime({
				targets: part.letters,
				height: '7em',
				easing: 'easeInOutSine',
				opacity: [1, 0],
				delay: anime.stagger(50),
				duration: 500,
				complete: () => state = 'hidden'
			});
		}
	};
	hoverPart.on.hover(handlers.hoverIn, handlers.hoverOut);
}
handleFeodoritiyPartText(molecule.red, molecule.redHoverable, 10);
handleFeodoritiyPartText(molecule.purple, molecule.purpleHoverable, 10);
handleFeodoritiyPartText(molecule.yellow, molecule.yellowHoverable, 10);
handleFeodoritiyPartText(molecule.green, molecule.greenHoverable, 10, true);
handleFeodoritiyPartText(molecule.sky, molecule.skyHoverable, 10, true);
handleFeodoritiyPartText(molecule.blue, molecule.blueHoverable, 10, true);

//cards on yellow page (speed of work)
let cards = {
	time: sel('.speed .card.time'),
	queue: sel('.speed .card.queue'),
	fast: sel('.speed .card.fast'),
	wrapper: sel('.speed .picture')
};

cards.wrapper.on.hover(
	() => {
		anime({
			targets: [cards.fast, cards.queue, cards.time],
			translateX: anime.stagger(['-14em', '14em']),
			translateY: anime.stagger(['-1em', '1em'])
		});
	}, () => {
		anime({
			targets: [cards.fast, cards.queue, cards.time],
			translateX: anime.stagger(['-2em', '2em']),
			translateY: 0
		});
	}
);

//page creation steps animation
sela('.creationsteps .square.absolute').forEach(sq => {
	sq.on.hover(() => {
		let targets = sq.parent().prev().sela("div");
		anime({
			targets: targets,
			opacity: 1,
			delay: anime.stagger(100),
			translateX: ['-0.5em', 0],
			easing: 'linear',
			duration: 200,
		});
		anime({
			targets: sq.prev(),
			scale: '1.1, 1.1'
		});
	}, () => {
		let targets = sq.parent().prev().sela("div");
		anime({
			targets: targets,
			opacity: 0,
			delay: anime.stagger(100),
			easing: 'linear',
			duration: 200,
		});
		anime({
			targets: sq.prev(),
			scale: '1.0, 1.0'
		});
	});
});

//sections setup
function handlePartEvents(section) {
	section = section.destruct({ lampas: 0 });
	section.on.hover(() => {
		if (!section.overscrolled)
			section.class("section_hover")
	}, () => {
		if (!section.overscrolled)
			section.unclass("section_hover")
	});
	section.on.click(e => {
		e.stopPropagation();
		section.unclass('section_hover');
		window.scrollTo({ top: section.offsetTop, behavior: 'smooth' });
	});
}
function handleHoverableFeodoritiyPartClick(part, hoverablePart) {
	hoverablePart.on.click(() => {
		// part.unclass("section_pop");
		window.scrollTo({ top: part.offsetTop, behavior: "smooth" });
	});
}

function handleAllForSection(section, moleculeHoverablePart) {
	handlePartEvents(section);
	handleHoverableFeodoritiyPartClick(section, moleculeHoverablePart);
}

handleAllForSection(adaptivityPage, molecule.purpleHoverable);
handleAllForSection(designPage, molecule.redHoverable);
handleAllForSection(speedPage, molecule.yellowHoverable);
handleAllForSection(creationSteps, molecule.greenHoverable);
handleAllForSection(staticPage, molecule.skyHoverable);
handleAllForSection(orderPage, molecule.blueHoverable);

mainPage.on.click(e => {
	e.stopPropagation();
	mainPage.unclass('section_hover');
	window.scrollTo({ top: mainPage.offsetTop, behavior: 'smooth' });
});
handlePartEvents(examplesPage);

mainPage.sel('#scrollToExamplesButton').on.click(() => window.scrollTo({ top: examplesPage.offsetTop, behavior: 'smooth' }));