trigger_defined = true;
last_effected = noone;

is_going_left = false;

// This code gets run when a player touches us
function on_trigger(player)
{
	last_effected = player;
	player.wind_effect = wind_speed;
	show_debug_message("Trigger");
}