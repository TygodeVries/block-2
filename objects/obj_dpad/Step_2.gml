/// @description Insert description here
// You can write your code in this editor
time_until_visible -= delta_time / 1000000;
if(time_until_visible < 0)
{
	visible = true;
}

if(array_contains(global.signal, destroy_signal))
{
	instance_destroy(self);
}