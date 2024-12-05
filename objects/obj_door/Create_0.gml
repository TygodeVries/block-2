/// @description Insert description here
// You can write your code in this editor

image_speed = 0;

collision_defined = true;
function on_collision(player)
{
	if(player.is_player_one)
	{
		// Check if we have at least one key
		if(global.player_one_keys > 0)
		{
			global.player_one_keys--;
			open();
		}
	}
	else
	{
		// Check if we have at least one key
		if(global.player_two_keys > 0)
		{
			global.player_two_keys--;
			open();
		}
	}
	
}

function open()
{
	image_speed = 0.4;
	solid = false;
}