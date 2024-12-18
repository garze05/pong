// Set correct background
layer_background_index(background, global.menu); // 0 playing, 1 menu

// Set and get the correct sizes for the texts
var _sizeTitle = 100 // In px, size of the title text i want
var _sizeOptions = 20 // In px, size of the options text i want
var _sizeInfo = 8 // In px, size of the info text i want

var _currTitleSize = string_height("PONG");
var _versionSize = string_height(infoVersion);
var _devSize = string_height(infoDev);

// Get the correct size for each text
var _titleScale = _sizeTitle / _currTitleSize 
var _versionScale = _sizeInfo / _versionSize
var _devScale = _sizeInfo / _devSize

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
    {	
        draw_set_color(c_white); 
        draw_text_transformed(room_width/2, room_height-64, "Press R to restart scores", 0.5, 0.5, 0);
        draw_scores();
    }
    else {
        if resetCount >= 4
        {
            var messages = [
                "Already reseted, don't worry",
                "Reseting the 0 scores to 0...",
                "what you doing bud...",
                "...",
                "Are you okay?",
                "Stop. Please.",
                "Do you need help?",
                "This is getting weird...",
                "WHAT ARE YOU DOING?!",
                "Your R key is BEGGING for mercy",
                "This is the number of times you have shortened your R Key Lifespan: " + string(resetCount)
            ];
            
            var index = min((resetCount - 4) div 3, array_length(messages) - 1);
            draw_set_color(c_white)
            // Glitchy text effect
            if (resetCount >= 50) {
                var original_text = messages[index];
                var glitchy_text = "";
                for (var i = 0; i < string_length(original_text); i++) {
                    if (random(1) > 0.7) {
                        glitchy_text += chr(irandom_range(33, 126));
                    } else {
                        glitchy_text += string_char_at(original_text, i+1);
                    }
                }
                draw_text_transformed(room_width/2, room_height-64, glitchy_text, 0.5, 0.5, 0);
            } else {
                draw_text_transformed(room_width/2, room_height-64, messages[index], 0.5, 0.5, 0);
            }
            
        }
    }

    
    // Draw info about the game
    draw_set_color(c_white)
    draw_text_transformed(30, room_height-10, infoVersion, _versionScale, _versionScale, 0)
    draw_text_transformed(room_width-30, room_height-10, infoDev, _devScale, _devScale, 0)
}
else // Draw player's scores
{
	draw_scores()	
}

draw_set_color(c_white)