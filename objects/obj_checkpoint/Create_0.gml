/// @description Insert description here
// You can write your code in this editor
collision_defined = true;


// This code gets run when a player touches us
function on_collision(player)
{
	player.checkpoint.x = player.x;
	player.checkpoint.y = player.y;
	
	solid = false;
}
