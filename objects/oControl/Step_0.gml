// Send my step variables to oDraw
with (draw) { optionSelected = other.optionSelected;  }

if global.gameMode == 2 && onlineInitialized == false
{
    onlineInitialized = init_online()
}

// Detect keys
input()
// We need variables for either of the two possible inputs
var _up = up[0] || up[1]
var _down = down[0] || down[1]

#region cancel key pressed
// If we want to go back to menu from playing
if (cancel)
{
	switch(global.menu)
	{
		case true:
			// If we havent played a score, dont execute
			if global.points.Player1 == 0 && global.points.Player2 == 0 { break; }
			global.menu = false
		break
		case false:
			global.menu = true
		break
	}
}
#endregion

// If we arent in menu, we dont need to execute any of this:
if !global.menu { exit; }

#region up, down pressed
// Lets be able to hold the key but add a delay between changing menu options
if (_up && keyTimer == 0)
{
    audio_play_sound(sndSelect, 0, 0,1,0,2)
    keyTimer = keyCooldown
    optionSelected--
    // Wrap around at the top of the menu
    if (optionSelected< 0) { optionSelected = menuSize - 1}
}
else if(_down && keyTimer == 0)
{
    audio_play_sound(sndSelect, 0, 0,1,0,2)
    keyTimer = keyCooldown
    optionSelected++
    // Wrap around at the bottom of the menu
    if (optionSelected >= menuSize) { optionSelected = 0 }   
}
	        //show_debug_message(global.gameMode)
if keyTimer > 0 { keyTimer-- }	
#endregion
	
#region confirm key pressed
// If we hit enter, we look at the option selected and play
if (confirm)
{
	audio_play_sound(sndSelect, 0, 0);
	global.menu = false;
    global.gameMode = optionSelected
}
#endregion
	
#region restart key pressed
// Restart scores if restartKey in menu
if (restart)
{
	audio_play_sound(sndRestart, 0, 0)
	global.points.Player1 = 0
	global.points.Player2 = 0
    resetCount++
}
#endregion