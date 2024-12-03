// Set correct background
layer_background_index(background, global.menu); // 0 playing, 1 menu

// Set and get the correct sizes for the texts
var _sizeTitle = 100 // In px, size of the title text i want
var _sizeOptions = 20 // In px, size of the options text i want
var _currTitleSize = string_height("PONG");
var _titleScale = _sizeTitle / _currTitleSize 
var _spacing = 20


function draw_scores()
{
	draw_text_transformed(room_width/2-128,64,global.points.Player1,2,2,0)
	draw_text_transformed(room_width/2+128,64,global.points.Player2,2,2,0)	
}

if global.menu == true // Draw the main menu
{
	draw_text_transformed(room_width/2,room_height/2-64,"PONG", _titleScale, _titleScale, 0)
	// Cycle through all the menu options to display them and assign them their correct font size
	for (var _i = 0; _i < menuSize; _i++)
	{
		// Verify if this is the selected option
	    if (_i == optionSelected) {
	        // Change color to yellow on selected option
	        draw_set_color(c_yellow);
	    }
		else
		{
			draw_set_color(c_white);
		}
		var _scale = _sizeOptions / string_height(menu_options[_i])
		draw_text_transformed(room_width/2, room_height/2 + _i*_spacing, menu_options[_i], _scale,_scale,0)
	}
	
	// Present the option to restart scores if we go back to menu from playing and we had points
	if global.points.Player1 != 0 || global.points.Player2 != 0
	{	draw_set_color(c_white); draw_text_transformed(room_width/2, room_height-64,"Press R to restart scores",0.5,0.5,0) 
		draw_scores()
	}
}
else // Draw player's scores
{
	draw_scores()	
}

draw_set_color(c_white)