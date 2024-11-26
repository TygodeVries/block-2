/// @description Step on the camera

// Add to the turn
turn += global.turn_speed;

// Set camera angle
camera_set_view_angle(view_camera[0], turn);


// Debug rotate controls
if(keyboard_check(ord("L")))
{
	global.turn_speed += 0.01;
}

if(keyboard_check(ord("J")))
{
	global.turn_speed -= 0.01;
}

if(keyboard_check(ord("O")))
{
	camera_x += 3;
}

if(keyboard_check(ord("U")))
{
	camera_x -= 3;
}


camera_set_view_pos(view_camera[0], camera_x, camera_y);
