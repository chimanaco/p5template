/*
    author:chimanaco

    inspired: 
    Olympus digital billboard which you can see from Shinjuku station

    awesome sample
    https://github.com/davidedc/using-dat-gui-with-processing-js

 */

// color
int bgColor = color(0);
int maxHue = 2;
float hueNum = 0;
float s = 0.75;
float b = 0.5;

// num
int num = 0;
ArrayList particles;

// timer
int timer = 0;

/* ////////////////////////////
    setup
//////////////////////////// */

void setup() {
    size(window.innerWidth, window.innerHeight);
    colorMode(HSB, maxHue, 1, 1);
    background(bgColor);

    frameRate(30);

    // createArray
    particles = new ArrayList();
    particles.add(new particle(num));
}

/* ////////////////////////////
    loop
//////////////////////////// */

void draw() {
    background(bgColor);

    // reset
    if(window.reset) {
        num = 0;        
        timer = 0;
        
        // createArray
        particles = new ArrayList();
        particles.add(new particle(num));

        window.reset = false;
    }

    timer++;

    num = particles.size();

    if (num < window.line) {
        if(timer > window.margin ) {
            particles.add(new particle(hueNum));
            timer = 0;
        }
    }

    for (int i = particles.size()-1; i >= 0; i--) {
        particle p = (particle) particles.get(i);
        p.run();
    }

    if(hueNum > maxHue) { hueNum = 0; }
    hueNum += 0.01;
}


/* ////////////////////////////
    particle class
//////////////////////////// */

class particle {
    float sx = 0;
    float ex = 0;
    float offset = 0;
    float myHue;
    float t;

    boolean positive = true;    // if positive it goes right,

    //constructor
    particle(float myNum) {
        myHue = myNum;
    }

    // run
    void run() {
        if (positive && sx > window.innerWidth) {
            positive = false;
            offset = 0;
        }

        if (!positive && sx < 0) {
            positive = true;
            offset = 0;
        }

        if (positive) {
            offset++;
            sx = sx + window.margin; 
            ex = sx + offset * window.speed;
        } else {
            offset--;
            sx = sx - window.margin; 
            ex = sx + offset * window.speed;
        }

        if(window.colorOn) {
            stroke(myHue, s, b);
        } else {
            stroke(255, s);
        }
        line(sx, 0, ex, height);
    }
}