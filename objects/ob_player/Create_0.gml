depth = -100; // Draw in front of other objects

our_tilemap = layer_tilemap_get_id("Level"); // Get the tilemap to collide with

velocity_x = 0;
velocity_y = 0;

on_ground = false;

if(is_player_one)
{
	global.player_one = self;
}
else
{
	global.player_two = self;
}

old_x = 0;
old_y = 0;

global.collisions_one = [];
global.collisions_two = [];

goal_x = -1;
goal_y = -1;

is_getting_dragged = false;

global.player_one_keys = 0;
global.player_two_keys = 0;