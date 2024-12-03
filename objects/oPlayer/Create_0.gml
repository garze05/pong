y = room_height/2

// Online
if (global.online) 
{
    if (player_id == 0)
    {
        x = 32
    }
    else if (player_id == 1)
    {
        x = room_width-32
    }
}

spd = 4 // Speed for the bar to move
dir = 0

// Input
up = 0
down = 0