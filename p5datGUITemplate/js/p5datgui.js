/*
	based on:
	davidedc/using-dat-gui-with-processing-js
	https://github.com/davidedc/using-dat-gui-with-processing-js

*/

// variable
window.line = 100;
window.speed = 1;
window.margin = 10;
window.colorOn = true;
window.reset = false;

// clear canvas
window.clearCanvas = function(){
    window.reset = true;
}

// dat.GUI
window.onload = function() {
    var gui = new dat.GUI();
    gui.add(window, 'line', 1, 1000).onChange(function(){ window.updating = true; });
    gui.add(window, 'speed', 0, 5).onChange(function(){ window.updating = true; });
    gui.add(window, 'margin', 0, 20).onChange(function(){ window.updating = true; });
    gui.add(window, 'colorOn');
    gui.add(window, 'clearCanvas');
};