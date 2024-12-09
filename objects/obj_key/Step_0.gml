// This codes gets run onces when the key is created.

// We let the players know they should let us know when they touch us.
collision_defined = true;


// This code will run when one of the player touches us
function on_collision(player)
{
	// If the player is player one
	player.add_to_inventory(item_type)
	
	// Thanos snap the key object.
	instance_destroy(self);
}