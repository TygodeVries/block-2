/// @description Insert description here
// You can write your code in this editor
function start()
{
	show_debug_message("Starting cutscene...");
	timeline_index = cutscene;
	timeline_position = 0;
	timeline_running = true;
	
	timeline_speed = 1 / 60;
	timeline_loop = false;
	
}