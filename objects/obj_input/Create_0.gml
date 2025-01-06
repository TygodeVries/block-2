// Just please, dont touch this.
// If you need help with adding an button, just let me (Tygo) know.


global.input_p1_left = false;
global.input_p1_right = false;
global.input_p1_jump = false;
global.input_p1_interact = false;

global.input_p2_left = false;
global.input_p2_right = false;
global.input_p2_jump = false;
global.input_p2_interact = false;

input_p1_jump_last_frame = false;
input_p2_jump_last_frame = false;


function do_jump(_player_one)
{
	if(_player_one && global.input_p1_jump) return true;
	if(!_player_one && global.input_p2_jump) return true;
	return false;
}

function do_interact(_player_one)
{
	if(_player_one && global.input_p1_interact) return true;
	if(!_player_one && global.input_p2_interact) return true;
	return false;
}


function do_left(_player_one)
{
	if(_player_one && global.input_p1_left) return true;
	if(!_player_one && global.input_p2_left) return true;
	return false;
}

function do_right(_player_one)
{
	if(_player_one && global.input_p1_right) return true;
	if(!_player_one && global.input_p2_right) return true;
	return false;
}

function set_data(input, keyboard, gamepad)
{
	strings = string_split(input, ", ");
	
	for(_i = 0; _i < array_length(strings); _i++)
	{
		type_value = string_split(strings[_i], "_");
		type = type_value[0];
		value = type_value[1];
		
		if(type == "k")
		{
			array_push(keyboard, value);
		}
		
		if(type == "g")
		{
			array_push(gamepad, value);
		}
	}
}


show_debug_message("Loading keybinds...");

// Open the file
ini_open("Settings/player.ini");

gamepad_one_jump = [];
gamepad_two_jump = [];
gamepad_one_left = [];
gamepad_two_left = [];
gamepad_one_right = [];
gamepad_two_right = [];

gamepad_one_interact = [];
gamepad_two_interact = [];

keyboard_one_jump = [];
keyboard_two_jump = [];
keyboard_one_left = [];
keyboard_two_left = [];
keyboard_one_right = [];
keyboard_two_right = [];

keyboard_one_interact = [];
keyboard_two_interact = [];

show_debug_message($"{ord("W")}, {ord("A")}, {ord("D")}");


set_data(ini_read_string("keybinds", "player_one_jump", $"g_{gp_face1}, k_38"), keyboard_one_jump, gamepad_one_jump);
set_data(ini_read_string("keybinds", "player_one_left", "g_32783, k_37"), keyboard_one_left, gamepad_one_left);
set_data(ini_read_string("keybinds", "player_one_right", "g_32784, k_39"), keyboard_one_right, gamepad_one_right);
set_data(ini_read_string("keybinds", "player_one_interact", $"g_{gp_face2}, k_{vk_down}"), keyboard_one_interact, gamepad_one_interact);

set_data(ini_read_string("keybinds", "player_two_jump", $"g_{gp_face1}, k_87"), keyboard_two_jump, gamepad_two_jump);
set_data(ini_read_string("keybinds", "player_two_left", "g_32783, k_65"), keyboard_two_left, gamepad_two_left);
set_data(ini_read_string("keybinds", "player_two_right", "g_32784, k_68"), keyboard_two_right, gamepad_two_right);
set_data(ini_read_string("keybinds", "player_two_interact", $"g_{gp_face2}, k_{ord("S")}"), keyboard_two_interact, gamepad_two_interact);


// Close file
ini_close();


