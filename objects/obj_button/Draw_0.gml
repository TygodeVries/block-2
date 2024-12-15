/// @description Insert description here
// You can write your code in this editor

draw_self();

if(string_starts_with(run_function, "keybind:"))
{
	args = string_split(run_function, ":");
	keybind = args[1];


	
	if(keybind == "p1_jump")
	{
		draw_text_transformed(x + 10, y + 20, e(obj_input.keyboard_one_jump) + gamepad_translator(obj_input.gamepad_one_jump), 1.7, 1.7, 0); 
	}
	
	if(keybind == "p2_jump")
	{
		draw_text_transformed(x + 10, y + 20, e(obj_input.keyboard_two_jump) + gamepad_translator(obj_input.gamepad_two_jump), 1.7, 1.7, 0); 
	}
	
	if(keybind == "p1_left")
	{
		draw_text_transformed(x + 10, y + 20, e(obj_input.keyboard_one_left) + gamepad_translator(obj_input.gamepad_one_left), 1.7, 1.7, 0); 
	}
	
	if(keybind == "p2_left")
	{
		draw_text_transformed(x + 10, y + 20, e(obj_input.keyboard_two_left) + gamepad_translator(obj_input.gamepad_two_left), 1.7, 1.7, 0); 
	}
	
	if(keybind == "p1_right")
	{
		draw_text_transformed(x + 10, y + 20, e(obj_input.keyboard_one_right) + gamepad_translator(obj_input.gamepad_one_right), 1.7, 1.7, 0); 
	}
	
	if(keybind == "p2_right")
	{
		draw_text_transformed(x + 10, y + 20, e(obj_input.keyboard_two_right) + gamepad_translator(obj_input.gamepad_two_right), 1.7, 1.7, 0); 
	}
	
	if(keybind == "p1_interact")
	{
		draw_text_transformed(x + 10, y + 20, e(obj_input.keyboard_one_interact) + gamepad_translator(obj_input.gamepad_one_interact), 1.7, 1.7, 0); 
	}
	
	if(keybind == "p2_interact")
	{
		draw_text_transformed(x + 10, y + 20, e(obj_input.keyboard_two_interact) + gamepad_translator(obj_input.gamepad_two_interact), 1.7, 1.7, 0); 
	}
}