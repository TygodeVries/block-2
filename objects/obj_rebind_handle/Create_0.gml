// Write some default stuff, still need to finish this! -Tygo
function rebind_control()
{
	
}

function default_control()
{
	ini_open("Settings/player.ini");
	
	ini_write_string("keybinds", "player_one_jump", $"g_{gp_padu}, k_{vk_up}");
	ini_write_string("keybinds", "player_two_jump", $"g_{gp_padu}, k_{ord("W")}");
	
	ini_write_string("keybinds", "player_one_left", $"g_{gp_padl}, k_{vk_left}");
	ini_write_string("keybinds", "player_two_left", $"g_{gp_padl}, k_{ord("A")}");
	
	ini_write_string("keybinds", "player_one_right", $"g_{gp_padr}, k_{vk_right}");
	ini_write_string("keybinds", "player_two_right", $"g_{gp_padr}, k_{ord("D")}");
	
	ini_close();
}

rebind_control();
default_control();
