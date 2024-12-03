input() // Call my input keys

upKey = global.up1 || global.up2
downKey = global.down1 || global.down2
confirmKey = global.confirmKey
cancelKey = global.cancelKey
restartKey = global.restartKey

// Send my step variables to oDraw
with (draw) { optionSelected = other.optionSelected;  }

#region cancel key pressed
// If we want to go back to menu from playing
if (cancelKey)
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
if !global.menu { exit }

#region up, down pressed
// Lets be able to hold the key but add a delay between changing menu options
if (upKey || downKey) && keyTimer == 0 { 
	keyTimer = keyCooldown
	audio_play_sound(sndSelect, 0, 0,1,0,2)
	if (upKey) {
		optionSelected--
		// Wrap around at the top of the menu
		if (optionSelected < 0) { optionSelected = menuSize - 1 }
	}
	else if (downKey) {
		optionSelected++
		// Wrap around at the bottom of the menu
		if (optionSelected >= menuSize) { optionSelected = 0 }
	}

}
	
if keyTimer > 0 { keyTimer-- }	
#endregion
	
#region confirm key pressed
// If we hit enter, we look at the option selected and play
if (confirmKey)
{
	audio_play_sound(sndSelect, 0, 0)
	// Change our game state globals
	switch (optionSelected)
	{
		case 0:
			global.local = true
		break;
		case 1:
			global.local = false
		break;
		case 2:
			global.online = true
			global.local = false
	}
	global.menu = false
}
#endregion
	
#region restart key pressed
// Restart scores if restartKey in menu
if restartKey
{
	audio_play_sound(sndRestart, 0, 0)
	global.points.Player1 = 0
	global.points.Player2 = 0
}
#endregion

// Online
//if !global.online { exit }
//if instance_exists(oPlayer)
//{
	//instance_destroy(oPlayer)
	//rollback_define_player(oPlayer)
//
	//// If we havend been invited
	//if (!rollback_join_game())
	//{
		//rollback_create_game(2, true)
	//}
//}