/// @description Insert description here
// You can write your code in this editor

collision_defined = true;
function on_collision(player)
{
	if(player.is_player_one)
	{
		// Check if we have at least one key
		if(global.player_one_keys > 0)
		{
			instance_destroy(self);
			global.player_one_keys--;
		}
	}
	else
	{
		// Check if we have at least one key
		if(global.player_two_keys > 0)
		{
			instance_destroy(self);
			global.player_two_keys--;
		}
	}
	
}