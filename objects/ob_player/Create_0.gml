our_tilemap = layer_tilemap_get_id("Level"); // Get the tilemap to collide with

velocity_x = 0;
velocity_y = 0;

on_ground = false;

global.player_one = {x: x, y: y};
global.player_two = {x: x, y: y};

old_x = 0;
old_y = 0;

global.collisions_one = [];
global.collisions_two = [];