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


camera_x = (global.player_one.x + global.player_two.x) / 2;
camera_x -= camera_get_view_width(view_camera[0]) / 2;

real_x = lerp(real_x, camera_x, 0.1);
real_y = camera_y;


camera_set_view_pos(view_camera[0], round(real_x), round(real_y));
