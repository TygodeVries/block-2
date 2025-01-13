//try to get the diffrence og the x position of the camera with the new one and use that as the x value

var cam_x = camera_get_view_x(view_camera[0]);


if(cam_x != prev_cam_x)
{
	x -= (abs(cam_x - prev_cam_x)) * spd;
}

prev_cam_x = cam_x;