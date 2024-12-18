// Init game globals
    global.gameMode = 0; //0=local,1=ai,2=online
    global.menu = true // Are we on the menu

    global.points = {
        Player1: 0,
        Player2: 0
    };
    // Input description
    global.myInput = { 
        up:         [ord("W"), vk_up],
        down:       [ord("S"), vk_down],
        confirm:    vk_enter,
        cancel:     vk_escape,
        restart:    ord("R")
    };

// This input function does not use the rollback system (online)
// We need it because we wont be using the Rollback GameMaker input if we arent playing online
function input()
{
    up[0] = keyboard_check( global.myInput.up[0] )
    up[1] = keyboard_check( global.myInput.up[1] )
    down[0] = keyboard_check( global.myInput.down[0] )
    down[1] = keyboard_check( global.myInput.down[1] )
    confirm = keyboard_check_pressed( global.myInput.confirm )
    cancel = keyboard_check_pressed( global.myInput.cancel )
    restart = keyboard_check_pressed( global.myInput.restart )
}

function raycast_collision(x1, y1, x2, y2, obj)
{
	// Calculate total movement distance
	var _distanceX = x2 - x1
	var _distanceY = y2 - y1
	
	// Determine how many steps
	var _steps = max(abs(_distanceX), abs(_distanceY)) // Maximum positive converted value
	
	// Loop through each step
	for ( var i = 0; i <= _steps; i++ )
	{
		// Calculate interpolated position
		var check_x = x1 + (_distanceX * i / _steps)
		var check_y = y1 + (_distanceY * i / _steps)
		// Verify if there is a collision on this point
		if ( place_meeting(check_x, check_y, obj) )
		{
			return true
		}
	}
	return false
}

function random_pitch(_isInt, _min = 1, _max = 2)
{
	var _randomNum = 0
	if _isInt == true
	{
		_randomNum = irandom_range(_min, _max)
	}
	else
	{
		_randomNum = random_range(_min, _max)
	}
	return _randomNum
}

function init_online()
{
    if (instance_exists(oPlayer)) { instance_destroy(oPlayer); }
    rollback_define_input(global.myInput);
    rollback_define_player(oPlayer);
    var _joined = rollback_join_game();
    
    if (!_joined) { rollback_create_game(2, false); } // We only need to create a game for two players 
    return true
}

function rollback_update_score(p1_score, p2_score) {
    rollback_write_event(rollback_event_score, [p1_score, p2_score]);
}