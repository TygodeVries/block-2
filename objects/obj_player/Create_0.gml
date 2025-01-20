animation_walk = noone;
animation_idel = noone;
animation_falling = noone;



global.freezemotion = false;

// This code is ran at the beginning of every level
time_since_ground = 0;
time_since_air = 0;
// Set the depth level (for the ordering of the sprites) of the player. -100 meaning always in front.
depth = -100;

// Get our level tilemap
level_tilemap = layer_tilemap_get_id("Level"); // Get the tilemap to collide with

// Set the base velocity of the player to 0.
velocity_x = 0;
velocity_y = 0;

// Flag to check if we are on the ground.
on_ground = false;


particles = [];

// is_player_one is from the inspector. Setting these objects to a global value makes it easier to refrence them later
if(is_player_one)
{
	global.player_one = self;
}
else
{
	global.player_two = self;
}


// Create an inventory
inventory = [];


function add_to_inventory(item)
{
	array_push(inventory, item);
}

function has_in_inventory(item)
{
	return array_contains(inventory, item);
}

function remove_from_inventory(item)
{
	array_delete(inventory, get_inventory_index(item), 1);
}

function get_inventory_index(item)
{
	return array_get_index(inventory, item);
}

death_cooldown = 0;
speedup_time = 0;
checkpoint = {x: x, y: y}
is_dead = false;

function murder_and_kill()
{
	is_dead = true;
	sprite_index = spr_player_death;
	death_cooldown = 5;
	death_location.x = x;
	death_location.y = y;
}

death_location = {x: 0, y: 0}


function revive()
{
	is_dead = false;
	x = checkpoint.x;
	y = checkpoint.y;
	
	sprite_index = spr_placeholder;
}

wind_effect = 0;
slow_effect = 0;

swap_time = -1;
swap_loc = {x: x, y:y};

function swap(length, offset)
{
	gravity_modifier = -gravity_modifier; // Flip gravity
	jump_power = -jump_power;
	
	
	swap_loc.x = x;
	swap_loc.y = y;
	
	swap_time = length;
	
	y = y + offset;
	image_yscale = -image_yscale;
}


restarting = false;
restart_timer = 0;
