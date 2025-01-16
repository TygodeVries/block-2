// We run this code when the room is loaded.
camera_x = 0;
real_x = 0;
enable_secret_3d = false;



if(enable_secret_3d)
{
	var _viewMat = matrix_build_lookat(0, 0, 0, 0, 0, -10, 0, 1, 0);
	var _projMat = matrix_build_projection_perspective_fov(60, -300, 3, 30000);

	camera_set_view_mat(view_camera[0], _viewMat);
	camera_set_proj_mat(view_camera[0], _projMat);
}

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