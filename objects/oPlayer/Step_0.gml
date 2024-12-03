

// If we are on the menu we dont want to be able to move the players
if global.menu { exit }
    
if global.local == true {
	if player == 0
	{
		up = global.up1
		down = global.down1
	} 
	else // To play with other player in the same keyboard
	{
		up = global.up2
		down = global.down2
	}
}
else if global.online == false && player == 0
{
	up = global.up1 || global.up2
	down = global.down1 || global.down2
}

dir = down - up //-1 up, 1 down

// Move
y += dir * spd

// Control out of bounds paddles
// Dont get past down
if bbox_top >= room_height
{
	y = room_height+sprite_yoffset
}
// Dont get past up
if bbox_bottom <= 0
{
	y = -sprite_yoffset
}
	
// Create the ball when we move
if dir != 0
{
	if !instance_exists(oBall) { instance_create_depth(x ,y , 0 ,oBall) }
}

// AI CODE
if player != 1 { exit }
if global.local == true { exit }
if global.online == true { exit }

// Make the paddle press keystrokes
if instance_exists(oBall)
{
	y = oBall.y // Extremely simple. Later do a keyboard simulation AI
}