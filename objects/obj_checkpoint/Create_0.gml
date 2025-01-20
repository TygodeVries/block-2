/// @description Insert description here
// You can write your code in this editor
collision_defined = true;


// This code gets run when a player touches us
function on_collision(player)
{
	player.checkpoint.x = x;
	player.checkpoint.y = y;
	
	solid = false;
	sprite_index = spr_checkpoint;
}
