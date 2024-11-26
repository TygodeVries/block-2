/// @description Insert description here
// You can write your code in this editor
turn = 0; // Current rotation angle
global.turn_speed = 0; // Set default rotation speed to 0

camera_x = 0;
real_x = 0;

camera_y = 0;
real_y = 0;


function my_lerp(a, b, t)
{
	return a + (b - a) * t;
}