function array_key_down(a)
{
	for(i = 0; i < array_length(a); i++)
	{
		if(keyboard_check(a[i]))
		{
			return true;
		}
	}
	
	return false;
}

function array_gamepad_down(player_id, buttons)
{
	for(i = 0; i < array_length(buttons); i++)
	{
		if(gamepad_button_check(player_id, buttons[i]))
		{
			return true;
		}
	}
	
	return false;
}

global.input_p1_left = array_key_down(keyboard_one_left) || array_gamepad_down(0, gamepad_one_left);
global.input_p1_right = array_key_down(keyboard_one_right) || array_gamepad_down(0, gamepad_one_right);
global.input_p1_jump = array_key_down(keyboard_one_jump) || array_gamepad_down(0, gamepad_one_jump);

global.input_p2_left = array_key_down(keyboard_two_left) || array_gamepad_down(1, gamepad_two_left);
global.input_p2_right = array_key_down(keyboard_two_right) || array_gamepad_down(1, gamepad_two_right);
global.input_p2_jump = array_key_down(keyboard_two_jump) || array_gamepad_down(1, gamepad_two_jump);
