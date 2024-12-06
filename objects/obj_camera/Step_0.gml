// Avoid bug
if(delta_time / 1000000 > 0.1)
{
	show_debug_message($"Window was dragged! {delta_time / 1000000}")
	return;
}

// Move our camera to the center between the two players
camera_x = (global.player_one.x + global.player_two.x) / 2

// Add an offset to put the camera in the center
camera_x -= camera_get_view_width(view_camera[0]) / 2;

// We smoothly move to the point we want to reach 
real_x = lerp(real_x, camera_x, delta_time / 1000000 * 4);
real_y = lerp(real_y, camera_y, delta_time / 1000000 * 4);

// Update camera location
camera_set_view_pos(view_camera[0], round(real_x), round(real_y));