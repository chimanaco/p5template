/* ----------------------------

    --> name here
    
    Author: chimanaco
    Update: 1980/03/19

---------------------------- */

// color
color bgColor = color(0);
color drawColor = color(255);
color drawColor2 = color(255, 0, 255);
int bgAlpha = 10;

// parameter
float www = 100;
float hhh = 100;

// on / off
boolean colored = false;

// for cp5
String[][] cpRadioButtons = {
    {"ON", "false"},
    {"OFF", "true"}
};

String[][] cpSliders = {
    {"bgAlpha","0","255"},
    {"www","1","400"},
    {"hhh","1","400"},
};

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
    setupCP5(cpSliders);
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

    // on / off
    if (colored){
        stroke(drawColor2);        
    } else {
        stroke(drawColor);
    }

    line(mouseX, mouseY, www, hhh);
}

/* ////////////////////////////

    cp5 radio button (on / off) 

//////////////////////////// */

void radioButton(int n) {
    if(n == 0) {
        colored = true;
        println("0!");
    }else {
        colored = false;
       println("1!");
    }
}

