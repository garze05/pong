// Detect keys
input()

// Local code

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
        
        // AI CODE
        if player != 1 { break; }
        
    if instance_exists(oBall)
    {

        // Only moves if the ball is on its half of the field (right side)
        if (oBall.x > room_width / 2)
        {
            if (y+12 < oBall.y)
            {
                upKey = 0;
                downKey = 1;
            }
            else if (y-12 > oBall.y)
            {
                upKey = 1;
                downKey = 0;
            }
        }
        else
        {
            // Does not move if the ball is on the left half
            upKey = 0;
            downKey = 0;
        }
    }
    break;
}

// Online code
if (global.gameMode == 2) 
{
    if oControl.onlineInitialized
    {
        // Rollback system handles the input
        var _input = rollback_get_input(); 
        upKey = _input.up && !paused;
        downKey = _input.down && !paused;
        
        // Check for pause input
        if (cancel) {
            paused = !paused;
            //if (paused) {
                //audio_play_sound(sndPause, 0, 0);
            //} else {
                //audio_play_sound(sndUnpause, 0, 0);
            //}
        }
    }
}

// Movement logic
if (!paused) {
    dir = downKey - upKey //-1 up, 1 down
    y += dir * spd
}

// ... rest of your movement code

// Control out of bounds paddles
// Dont get past down
if bbox_top >= room_height
{
    y = room_height + sprite_yoffset
}
// Dont get past up
if bbox_bottom <= 0
{
    y = -sprite_yoffset
}
    
// Create the ball when we move
if dir != 0
{
    if !instance_exists(oBall) { instance_create_depth(x, y, 0, oBall) }
}