// This code gets run when the door has finished its animation

// We stop the animation
image_speed = 0;


if(is_open_animation)
{
	// We set the correct 'open-door' frame
	image_index = 3;
}
else
{
	// We set the correct 'open-door' frame
	image_index = 0;
}