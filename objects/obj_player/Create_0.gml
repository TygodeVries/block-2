// This code is ran at the beginning of every level

// Set the depth level (for the ordering of the sprites) of the player. -100 meaning always in front.
depth = -100;

// Get our level tilemap
level_tilemap = layer_tilemap_get_id("Level"); // Get the tilemap to collide with

// Set the base velocity of the player to 0.
velocity_x = 0;
velocity_y = 0;

// Flag to check if we are on the ground.
on_ground = false;

// is_player_one is from the inspector. Setting these objects to a global value makes it easier to refrence them later
if(is_player_one)
{
	global.player_one = self;
}
else
{
	global.player_two = self;
}


// Set the amount of keys we have back to 0. To make sure you cant bring in keys from other levels
global.player_one_keys = 0;
global.player_two_keys = 0;