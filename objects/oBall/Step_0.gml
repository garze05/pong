// Bounce in the up and down walls
if bbox_top <= 0 || bbox_bottom >= room_height
{
	// We clamp the y position to evade weird stuck bugs with the ball if it gets near the boundaries
	y = clamp(y, sprite_yoffset, room_height-sprite_yoffset)
	vspeed = -vspeed
	audio_play_sound(sndWall, 0, 0)
}

// Out of bounds
if bbox_left <= 0 || bbox_right >= room_width
{
	// Assign points to each player
    // After a point is scored
    if (global.gameMode == 2 && oControl.onlineInitialized) {
        // Increment score based on which player scored
        var _scored = (hspeed < 0) ? 1 : 2; // Assuming left wall scores for player 2, right for player 1
        if (_scored == 1) {
            global.points.Player2++;
        } else {
            global.points.Player1++;
        }
        
        // Sync the score using Rollback
        rollback_update_score(global.points.Player1, global.points.Player2);
    }
	if hspeed < 0 { global.points.Player2++ } else { global.points.Player1++ }
	audio_play_sound(sndPoint, 0, 0,1,0,2)
	instance_destroy()
}

hspeed = clamp(hspeed, -maxSpd, maxSpd)