/// @description Insert description here
// You can write your code in this editor
turn = 0; // Current rotation angle
global.turn_speed = 0; // Set default rotation speed to 0

camera_x = 0;
real_x = 0;

camera_y = 250;
real_y = 250;

cooldown_one = 0;


function my_lerp(a, b, t)
{
	return a + (b - a) * t;
}

function distance(ax, ay, bx, by)
{
    var a = abs(ax - bx);
    var b = abs(ay - by);


    return sqrt(a * a + b * b);
}
