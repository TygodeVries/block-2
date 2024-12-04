/// @description Insert description here
// You can write your code in this editor

collision_defined = true;
function on_collision(player)
{
	if(player.is_player_one)
	{
		global.player_one_keys++;
	}
	else
	{
		global.player_two_keys++;
	}
	
	instance_destroy(self);
}