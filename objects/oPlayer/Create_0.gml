y = room_height/2

// Set my id to 1 if there is already one created of me
if instance_number(oPlayer) == 1 { player = 1 }

// Online
if (global.gameMode == 2)
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
else // Local or AI playing
{
    if (player == 0)
    {
        x = 32
    }
    else 
    {
        x = room_width-32
    }
}

spd = 4 // Speed for the bar to move
dir = 0

// Input
upKey = 0
downKey = 0