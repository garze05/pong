if ( x < room_width * 0.5 ) && ( hspeed <= 0 ) || ( x > room_width * 0.5 ) && ( hspeed >=0 )
{
	audio_play_sound(sndHit, 0, 0,1,0,2)
	hspeed = -hspeed * ballSpdMultiplier
	show_debug_message(hspeed)
}

vspeed = random_range(-maxAngle, maxAngle)