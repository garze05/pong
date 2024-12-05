
// Detect keys
input()

// If we are on the menu we dont want to be able to move the players, and should ignore that code
if global.menu { exit }
    
// How we should handle the player input depending on which gamemode we are
switch(global.gameMode)
{
    case 0: // Local
        // Assign the corresponding input to each local player
        upKey = up[player]
        downKey = down[player]
    break;
    case 1: // AI
        // Player can use either of the keys to move
        upKey = up[0] || up[1];
        downKey = down[0] || down[1];
    break;
    case 2: // Online
    
    // First make sure online is initialized
    if oControl.onlineInitialized
    {
        // Rollback system handles the input
        var _input = rollback_get_input(); 
        upKey = _input.up;
        downKey = _input.down;
    }
    break;
}
dir = downKey - upKey //-1 up, 1 down
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
if global.gameMode != 1 { exit }

// Make the paddle press keystrokes
if instance_exists(oBall)
{
	y = oBall.y // Extremely simple. Later do a keyboard simulation AI
}