// This codes gets run onces when the key is created.

// We let the players know they should let us know when they touch us.
collision_defined = true;


// This code will run when one of the player touches us
function on_collision(player)
{
	// If the player is player one
	if(player.is_player_one)
	{
		// Give them a key
		global.player_one_keys++;
	}
	
	// If its player two
	else
	{
		// give THEM a key
		global.player_two_keys++;
	}
	
	// Thanos snap the key object.
	instance_destroy(self);
}