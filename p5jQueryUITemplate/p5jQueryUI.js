/*

	author: chimanaco
	original:
	http://joseph-harrington.com/2012/03/controlling-processingjs-jqueryui/

*/
 
$(function() {
	// Set up jQuery UI sliders for each variable we want to control.
	$("#sliderLineLength").slider({
		value: pvars.lineLength,                        // initial slider value
		min: 1, max: 200, step: 1,                    // slider range and step settings
		slide: function(event, ui) {                  // function called when slider is adjusted
			pvars.lineLength = ui.value;                    // update the variable (used by pjs sketch)
			$("#textLineLength").                          // update the text label with the new value
				text("# line length: " + pvars.lineLength);  
		}
	});
	
	$("#sliderSpeed").slider({
		value: pvars.speed,
		min: 0, max: 1, step: 0.01, 	  
		slide: function(event, ui) {
			pvars.speed = ui.value;
			$("#textSpeed").text("# speed: " + pvars.speed);
		}
	});
	
	$("#toggleRotation").button();
	$("#toggleRotation").click(function() {
		// get the handle to the sketch so we can call its functions
		var p = Processing.getInstanceById('p5jQueryUIDemo');
		if (p) p.toggleRotation();
	});
	
	// set initial text of ui labels
	$("#textLineLength").text("# line length: " + pvars.lineLength);
	$("#textSpeed").text("# speed: " + pvars.speed);

});