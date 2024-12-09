/// @description Insert description here
// You can write your code in this editor

alive_time += delta_time / 1000000;

timer -= delta_time / 1000000 * alive_time;

if(alive_time < 3)
{
	
	if(timer < 0)
	{
		timer = 0.2;
		frame++;
		if(frame == 2)
			frame = 0;
		
		image_index = frame;
	
	}
	
	return;
}

if(alive_time < 5)
{
	solid = true;
	image_index = 2;
	return;
}

visible = false;
solid = false;

if(alive_time > 7)
{
	visible = true;
	alive_time = 0;
	image_index = 0;
}

