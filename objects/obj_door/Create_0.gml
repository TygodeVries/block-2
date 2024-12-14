// We run this when the door is created.

// Turn off the door animation.
image_speed = 0;

// Let the players know we want to be notified when they touch us
collision_defined = true;


// This code gets run when a player touches us
function on_collision(player)
{
	
	if(item_requirement != "none")
	{
		// Check if we have this item
		if(player.has_in_inventory(item_requirement))
		{
			// Remove the key from the inventory
			player.remove_from_inventory(item_requirement);
			open();
		}
	}	
}

is_open = false;
is_open_animation = false;

// This function will open the door
function open()
{
	if(is_open) return;
	is_open_animation = true;
	// Start the animation
	image_speed = 0.4;
	
	// Make it so the player can walk through the door
	solid = false;
	is_open = true;
}

function close()
{
	if(!is_open) return;
	is_open_animation = false;
	image_speed = -0.4;
	solid = true;
	is_open = false;
}