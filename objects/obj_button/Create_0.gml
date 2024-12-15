// Just dont touch this pretty please

if(is_init_button)
	global.selected_button = button_id;
global.button_cooldown = 1;
image_speed = 0;

function e(array)
{
	out = "";
	
	for(_i = 0; _i < array_length(array); _i++)
	{
		token = array[_i]
		
		if(token == vk_up)
		{
			out += "Up Arrow, ";
		}
		else if(token == vk_left)
		{
			out += "Left Arrow, ";
		}
		else if(token == vk_right)
		{
			out += "Right Arrow, ";
		}
		else if(token == vk_down)
		{
			out += "Down Arrow, ";
		}
		else
		{
			out += chr(token) + ", ";
		}
	}
	
	show_debug_message(out);
	return out;
}

function gamepad_translator(array)
{
	out = "";
	
	for(_i = 0; _i < array_length(array); _i++)
	{
		token = array[_i]
		
		if(token == gp_face1)
		{
			out += "Gamepad A, ";
		}
		
		if(token == gp_face2)
		{
			out += "Gamepad B, ";
		}
		
		if(token == gp_face3)
		{
			out += "Gamepad X, ";
		}
		
		if(token == gp_face4)
		{
			out += "Gamepad Y, ";
		}
		
		if(token == gp_padl)
		{
			out += "Gamepad Left, ";
		}
		
		if(token == gp_padr)
		{
			out += "Gamepad Right, ";
		}
		
		if(token == gp_padu)
		{
			out += "Gamepad Up, ";
		}
		if(token == gp_padd)
		{
			out += "Gamepad Down, ";
		}
	}
	
	show_debug_message(out);
	return out;
}