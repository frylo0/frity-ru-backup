class Point {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }

    copy() {
        return new Point(this.x, this.y);
    }
};

class Vector {
    constructor(a, b) {
        this.a = a;
        this.b = b;
        this.x = b.x - a.x;
        this.y = b.y - a.y;
    }

    static fromXY(x, y) {
        return new Vector(new Point(0, 0), new Point(x, y));
    }

    plus(vector) {
        return new Vector.fromXY(this.x + vector.x, this.x + vector.y);
    }

    get length() {
        return Math.sqrt(this.x ** 2 + this.y ** 2);
    }
}

class StartPositionGenerator {
    constructor(runners, factorX, factorY) {
        this.runners = runners;
        this.factorX = factorX;
        this.factorY = factorY;
    }

    move() {
        let i = 0;
        const screenCenter = new Point(screen.width / 2, screen.height / 2);
        for (let runner of this.runners) {
            let groupStep = Math.trunc(i / 10) * 10;
            let zeroToNine = i - groupStep;
            let topFactor = (Math.sin(i) + groupStep - borders.length / 2) * this.factorY;
            let leftFactor = (zeroToNine - 5) * this.factorX;
            i++;

            runner.moveCornerToPoint(new Point(
                screenCenter.x - runner.transform.radius + leftFactor,
                screenCenter.y - runner.transform.radius + topFactor,
            ));
        }
    }
}

const edges = {
    top: new Point('cx', 0),
    bottom: new Point('cx', document.documentElement.clientHeight),
    left: new Point(0, 'cy'),
    right: new Point(document.documentElement.clientWidth, 'cy'),
};

class Runner {
    /**
     * @param {HTMLDivElement} border 
     */
    constructor(border) {
        this.border = border;
        this.rofler = border.querySelector('.rofler');

        let borderRect = border.getBoundingClientRect();
        let radius = borderRect.width / 2;

        this.transform = {
            center: new Point(borderRect.left + radius, borderRect.top + radius),
            radius: radius,
            diameter: radius * 2,
        };
    }

    runFromPoints(...points) {
        const center = this.transform.center;
        let moveX = 0, moveY = 0;
        for (let point of points) {
            point = point.copy();

            if (point.x == 'cx') point.x = center.x;
            if (point.y == 'cy') point.y = center.y;

            const vectorToCenter = new Vector(point, center);
            const vectorFullLenght = this.transform.radius;
            const toCenterRelation = vectorToCenter.length / vectorFullLenght;

            if (toCenterRelation > 1) continue;

            moveX += (toCenterRelation ** (-1) - 1) * vectorToCenter.x;
            moveY += (toCenterRelation ** (-1) - 1) * vectorToCenter.y;
        }

        if (!(moveX && moveY)) return;

        const moveVector = Vector.fromXY(moveX, moveY);
        this.moveByVector(moveVector);
    }

    moveByVector(vector) {
        const newLeft = parseFloat(this.border.style.left) + vector.x,
            newTop = parseFloat(this.border.style.top) + vector.y;
        this.border.style.left = newLeft + 'px';
        this.border.style.top = newTop + 'px';

        this.transform.center.x += vector.x;
        this.transform.center.y += vector.y;
    }

    moveCornerToPoint(point) {
        this.border.style.left = point.x + 'px';
        this.border.style.top = point.y + 'px';

        this.transform.center.x = point.x + this.transform.radius;
        this.transform.center.y = point.y + this.transform.radius;
    }

    watchArea(allRunnersArr) {
        const runner = this;

        let indexOfRunner = allRunnersArr.indexOf(runner);
        const targetRunnersCenters = (allRunnersArr.slice(0, indexOfRunner).concat(allRunnersArr.slice(indexOfRunner + 1)))
            .map(runner => runner.transform.center);

        window.addEventListener('mousemove', e => {
            const cursor = new Point(e.clientX, e.clientY);


            if (window.overflowMode) {
                runner.runFromPoints(cursor, edges.top, edges.bottom, edges.left, edges.right);
                return;
            }

            runner.runFromPoints(cursor, edges.top, edges.bottom, edges.left, edges.right, ...targetRunnersCenters);
        });
    }
}

document.body.innerHTML += '<div class="border"><div class="rofler"></div></div>'.repeat(60);

let borders = document.querySelectorAll('.border');

const runners = Array.from(borders).map(b => new Runner(b));

let startPositionMover = new StartPositionGenerator(runners, 70, 10);
startPositionMover.move();

for (const runner of runners) {
    runner.watchArea(runners);
}

window.overflowMode = false;
window.changeMode = function () {
    //circles to start positions slightly
    borders.forEach(b => b.classList.add('trans25'));

    startPositionMover.move();

    window.overflowMode = !window.overflowMode;
};

borders[0].addEventListener('transitionend', e => {
    borders.forEach(b => b.classList.remove('trans25'));
});

window.addEventListener('keydown', e => {
    console.log(e.code);
    if (e.code == "Space") {
        window.changeMode();
    }
});