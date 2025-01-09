// Avoid bug
if(delta_time / 1000000 > 0.1)
{
	show_debug_message($"Window was dragged! {delta_time / 1000000}")
	return;
}

curw = camera_get_view_width(view_camera[0]);
curh = camera_get_view_height(view_camera[0])

curw = lerp(curw, goal_width, delta_time / 1000000 * camera_speed); 
curh = lerp(curh, goal_height, delta_time / 1000000 * camera_speed); 

camera_set_view_size(view_camera[0], curw, curh);


if(!in_cutscene_mode)
{
	// Move our camera to the center between the two players
	camera_x = (global.player_one.x + global.player_two.x) / 2
	camera_y = (global.player_one.y + global.player_two.y) / 2
}


// We smoothly move to the point we want to reach 
real_x = lerp(real_x, camera_x - (camera_get_view_width(view_camera[0]) / 2), delta_time / 1000000 * camera_speed);
real_y = lerp(real_y, camera_y - (camera_get_view_height(view_camera[0]) / 2), delta_time / 1000000 * camera_speed);

// Update camera location
camera_set_view_pos(view_camera[0], real_x, real_y);

function now()
{
	curw = goal_width;
	curh = goal_height;
	camera_set_view_size(view_camera[0], goal_width, goal_height);
	
	real_x = camera_x - (camera_get_view_width(view_camera[0]) / 2);
	real_y = camera_y  - (camera_get_view_height(view_camera[0]) / 2);
	camera_set_view_pos(view_camera[0], real_x, real_y);
}

if (keyboard_check_pressed(ord("F")))
{
        window_set_fullscreen(!window_get_fullscreen());
}