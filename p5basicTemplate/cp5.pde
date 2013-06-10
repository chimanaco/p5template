/* ----------------------------

    controlp5 setup for p5 template

    Author: chimanaco
    Update: 2013/06/10
 
---------------------------- */

// cp5
import controlP5.*;
ControlP5 cp5;
// boolean cp5Visble = true;

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

    // radio button (on / off)
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

    cp5 visible on / off

//////////////////////////// */

// void mouseClicked() {
//     if (cp5Visble) {
//         cp5.hide();
//     } else {
//         cp5.show();
//     }

//     cp5Visble = !cp5Visble;
// }
