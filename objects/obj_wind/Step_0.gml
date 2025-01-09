if(last_effected != noone)
{
	last_effected.wind_effect = 0;
	last_effected = noone;
}

// Move
if(is_going_left)
{
	x -= move_speed;
}
else
{
	x += move_speed;
}

if(x < min_x)
	is_going_left = false;
	
if(x > max_x)
	is_going_left = true;