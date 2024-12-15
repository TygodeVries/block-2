/// @description Insert description here
// You can write your code in this editor

cooldown--;
if(!visible)
{
	cooldown = 3;
}

if(cooldown < 0)
{
	for( var i = 32; i <= 591; i++){
	    if( keyboard_check( i)){
	        obj_rebind_handle.add(programming, $"k_{i}");
			room_restart();
			return;
	    }
	}
	for( var i = vk_left; i <= vk_down; i++){
	    if( keyboard_check( i)){
	        obj_rebind_handle.add(programming, $"k_{i}");
			room_restart();
			return;
	    }
	}

	gamepad_buttons = [gp_face1, gp_face2, gp_face3, gp_face4, gp_padd, gp_padl, gp_padr, gp_padu];

	for(var i = 0; i < 2; i++)
	{
		for(var j = 0; j < array_length(gamepad_buttons); j++)
		{
			if(gamepad_button_check_pressed(i, gamepad_buttons[j]))
			{
				obj_rebind_handle.add(programming, $"g_{gamepad_buttons[j]}");
				room_restart();
				return;
			}
		}
	}
}