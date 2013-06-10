/* ----------------------------

    fade Background function

    Author: chimanaco
    Update: 2013/06/10
 
---------------------------- */

/* ////////////////////////////
    fade background
//////////////////////////// */

void fadeBackground(color c, int a) {
    noStroke();
    fill(c, a);
    rectMode(CORNER);
    rect(0, 0, width, height);
}
