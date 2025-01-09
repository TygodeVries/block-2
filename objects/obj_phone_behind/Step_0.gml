/// @description Insert description here
// You can write your code in this editor
time_left -= delta_time / 1000000;
if(time_left < 0)
{
	instance_destroy(self);
}