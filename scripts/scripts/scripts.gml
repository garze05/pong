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