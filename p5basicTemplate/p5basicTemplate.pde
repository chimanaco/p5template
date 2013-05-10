/* ----------------------------

    --> name here
    Author: chimanaco
    Update: 1980/03/19

---------------------------- */

// cp5
import controlP5.*;
ControlP5 cp5;
boolean cp5Visble = true;

String[][] cpArray = {
    {"bgAlpha","0","255"},
    {"www","1","400"},
    {"hhh","1","400"},
};

// color
color bgColor = color(0);
color drawColor = color(255, 255, 255);
int bgAlpha = 10;

float www = 100;
float hhh = 100;

/* ////////////////////////////
    setup
//////////////////////////// */

void setup(){
    // Screen
    size(400,400);
    background(bgColor);
    smooth();
    colorMode(RGB);

    // setup cp5
    setupCP5(cpArray);
}

/* ////////////////////////////
    loop
//////////////////////////// */

void draw() {
    // Background
    //background(bgColor);
    fadeBackground(bgColor, bgAlpha);

    // move Positon
    // www = www + random(-5, 5);
    // hhh = hhh + random(-5, 5);

    stroke(drawColor);
    line(mouseX, mouseY, www, hhh);
}

/* ////////////////////////////
    fade background
//////////////////////////// */

void fadeBackground(color c, int a) {
    noStroke();
    fill(c, a);
    rectMode(CORNER);
    rect(0, 0, width, height);
}

/* ////////////////////////////

    setup cp5.
    @param myArray required var name, min value, max value
    @return void

//////////////////////////// */

void setupCP5(String[][] myArray) {
    // cp5 position
    int xPos = 10;
    int yPos = 10;  
    int yMargin = 15;
    int len = myArray.length;

    // cp5 
    cp5 = new ControlP5(this);

    for (int i = 0; i < len; i++) {
        cp5.addSlider(myArray[i][0])
            .setPosition(xPos, yPos + yMargin * i )
                .setRange(float(myArray[i][1]), float(myArray[i][2]));
        ;
    }
}

/* ////////////////////////////

    cp5 visible on / off

//////////////////////////// */

void mouseClicked() {
    if (cp5Visble) {
        cp5.hide();
    } else {
        cp5.show();
    }

    cp5Visble = !cp5Visble;
}

