/* ----------------------------

    --> name here
    Author: chimanaco
    Update: 1980/03/19

---------------------------- */

// cp5
import controlP5.*;
ControlP5 cp5;
//boolean cp5Visble = true;

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

String[][] cpArray = {
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

    // on / off
    if (colored){
        stroke(drawColor2);        
    } else {
        stroke(drawColor);
    }

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

    cp5 setup
    @param sliders required var name, min value, max value for sliders
    @return void

//////////////////////////// */

void setupCP5(String[][] sliders) {
    // cp5 position
    int xPos = 10;
    int yPos = 10;  
    int yMargin = 15;

    // cp5 
    cp5 = new ControlP5(this);

    // radio button
    int rbSize = 10;

    cp5.addRadioButton("radioButton")
        .setPosition(xPos, yPos)
        .setSize(rbSize, rbSize)
        .setItemsPerRow(2)
        .setSpacingColumn(20)
        .addItem("ON", 0)
        .addItem("OFF", 1)
        .activate(1); 
        ;

    // slider
    int len = sliders.length;

    for (int i = 0; i < len; i++) {
        cp5.addSlider(sliders[i][0])
            .setPosition(xPos, yPos + yMargin * (i + 1) )
                .setRange(float(sliders[i][1]), float(sliders[i][2]));
        ;
    }   
}

/* ////////////////////////////

    cp5 radio button 

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


/* ////////////////////////////

    cp5 visible on / off

//////////////////////////// */

void mouseClicked() {
/*    if (cp5Visble) {
        cp5.hide();
    } else {
        cp5.show();
    }

    cp5Visble = !cp5Visble;*/
}

