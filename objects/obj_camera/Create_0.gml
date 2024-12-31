// We run this code when the room is loaded.
camera_x = 0;
real_x = 0;

camera_y = 100;
real_y = 100;

normal_width = camera_get_view_width(view_camera[0]);
normal_height = camera_get_view_height(view_camera[0]);

goal_width = normal_width;
goal_height = normal_height;

in_cutscene_mode = false;

started = 2;
camera_speed = 2;

function look_at(_x, _y)
{
	camera_x = _x;
	camera_y = _y;
}

function zoom(amount)
{
	goal_width = normal_width * amount;
	goal_height = normal_height * amount;
}