/// @description Insert description here
// You can write your code in this editor
collision_defined = true;
// This code will run when one of the player touches us
function on_collision(player)
{
	player.murder_and_kill();
}