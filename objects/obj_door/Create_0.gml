// We run this when the door is created.

// Turn off the door animation.
image_speed = 0;

// Let the players know we want to be notified when they touch us
collision_defined = true;


// This code gets run when a player touches us
function on_collision(player)
{
	// If player one touches us
	if(player.is_player_one)
	{
		// Check if we have at least one key
		if(global.player_one_keys > 0)
		{
			// Remove one key
			global.player_one_keys--;
			
			// Open the door
			open();
		}
	}
	
	// If player two touches us
	else
	{
		// Check if we have at least one key
		if(global.player_two_keys > 0)
		{
			// Remove one key
			global.player_two_keys--; 
			
			// Open the door
			open(); 
		}
	}
	
}

// This function will open the door
function open()
{
	// Start the animation
	image_speed = 0.4;
	
	// Make it so the player can walk through the door
	solid = false;
}