/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(vk_down))
{
	global.sound_master -= 0.1;
	
	audio_stop_all();
	ini_open("player.ini");
	ini_write_real("sound", "master", global.sound_master);
	ini_close();
	
	audio_play_sound(so_twitter_notification_sound, 10, false, global.sound_master);
	show_debug_message($"Volume: {global.sound_master}");
	
}

if(keyboard_check_pressed(vk_up))
{
	global.sound_master += 0.1;
	
	audio_stop_all();
	ini_open("player.ini");
	ini_write_real("sound", "master", global.sound_master);
	ini_close();
	
	audio_play_sound(so_twitter_notification_sound, 10, false, global.sound_master);
	show_debug_message($"Volume: {global.sound_master}");
}