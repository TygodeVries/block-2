/// @description Insert description here
// You can write your code in this editor

if(started > 0)
{
	show_debug_message("Start!");
	global.signal = ["level_start"];
	started--;
}
else
{
	global.signal = [];
}
