trigger_defined = true;
last_effected = noone;


// This code gets run when a player touches us
function on_trigger(player)
{
	last_effected = player;
	player.slow_effect = slow_speed;
	show_debug_message("Trigger");
}