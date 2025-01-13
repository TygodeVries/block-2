/// @description Insert description here
// You can write your code in this editor

if(keyboard_check(ord("N")) && keyboard_check(ord("U")) && keyboard_check(ord("K")) && keyboard_check(ord("E")))
{
	default_control();
}

function default_control()
{
	file_delete("Settings/player.ini");
	ini_open("Settings/player.ini");
	
	ini_write_string("keybinds", "player_one_jump", $"g_{gp_face1}, k_{vk_up}");
	ini_write_string("keybinds", "player_two_jump", $"g_{gp_face1}, k_{ord("W")}");
	
	ini_write_string("keybinds", "player_one_left", $"g_{gp_padl}, k_{vk_left}");
	ini_write_string("keybinds", "player_two_left", $"g_{gp_padl}, k_{ord("A")}");
	
	ini_write_string("keybinds", "player_one_right", $"g_{gp_padr}, k_{vk_right}");
	ini_write_string("keybinds", "player_two_right", $"g_{gp_padr}, k_{ord("D")}");
	
	ini_write_string("keybinds", "player_one_interact", $"g_{gp_face2}, k_{vk_down}");
	ini_write_string("keybinds", "player_two_interact", $"g_{gp_face2}, k_{ord("S")}");
	
	ini_close();
}