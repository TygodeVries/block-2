/// @description Insert description here
// You can write your code in this editor
if(signal != "none")
{
	if(array_contains(global.signal, signal))
	{
		visible = true;
		image_index = 0;
	}
	
	if(array_contains(global.signal, "stop_look_in_mirror"))
	{
		visible = false;
	}
}