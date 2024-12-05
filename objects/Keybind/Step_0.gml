/// @description Insert description here
// You can write your code in this editor

if(global.button_cooldown > 0)
{
	global.button_cooldown--;
	return;
}

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0)

// Check if the mouse is hovering over the button
var _hovering = position_meeting(_mx, _my, id);

if (_hovering && mouse_check_button_pressed(mb_left)) 
{
	global.selected_button = button_id;
	global.button_cooldown = 10;
}


if(global.selected_button == button_id)
{
	sprite_index = button_pressed;
	if(keyboard_check_pressed(vk_tab) || gamepad_button_check_pressed(0, gp_padd) || keyboard_check_pressed(vk_down))
	{
		global.selected_button = next_id;
		global.button_cooldown = 10;
	}
	
	if(gamepad_button_check_pressed(0, gp_padu) || keyboard_check_pressed(vk_up))
	{
		global.selected_button = last_id;
		global.button_cooldown = 10;
	}
		
	if(gamepad_button_check_pressed(0, gp_face1) || keyboard_check_pressed(vk_enter) || (mouse_check_button_pressed(mb_left) && _hovering))
	{
		if(run_function == "menu_main_quit")
		{
			game_end();
		}
		
		if(run_function == "menu_main_settings")
		{
			room_goto(menu_settings);
		}
		
		if(run_function == "menu_main_start")
		{
			room_goto(lv_test);
		}
		
		if(run_function == "menu_main")
		{
			room_goto(menu_main);
		}
		
		if(run_function == "menu_rebind")
		{
			room_goto(menu_rebind);
		}
	}
}
else
{
	sprite_index = button_unpressed;
}