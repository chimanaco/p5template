/*

	author: chimanaco
	original:
	http://joseph-harrington.com/2012/03/controlling-processingjs-jqueryui/

*/

color bgColor = color(0);
color strokeColor = color(255);
float angle = 0;
boolean rotationOn = false;

/* ////////////////////////////
    setup
//////////////////////////// */

void setup() {
	size(400, 400);
	smooth();
	stroke(strokeColor);
}

/* ////////////////////////////
    loop
//////////////////////////// */

void draw() {
	background(bgColor);
	translate(width / 2, height / 2);
	if(rotationOn) {
		angle += pvars.speed;
	}
	rotate(angle);
	line(0, 0, pvars.lineLength, 0);
}

/* ////////////////////////////
    Rotation on / off
//////////////////////////// */

void toggleRotation() {
	rotationOn = !rotationOn;
}