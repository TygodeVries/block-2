/// @description Insert description here
// You can write your code in this editor

var oldX = x;
var oldY = y;
var grafity = -_gravity;

velocity_y = velocity_y - grafity;

if((keyboard_check(vk_up) && is_player_one) || (keyboard_check(ord("W")) && !is_player_one))
{
	velocity_y = _jump;
	y += _jump;
}

if((keyboard_check(vk_left) && is_player_one) || (keyboard_check(ord("A")) && !is_player_one))
{
	x -= 3;
}

if ((keyboard_check(vk_right) && is_player_one) || (keyboard_check(ord("D")) && !is_player_one))
{
	x += 3;
}


show_debug_message($"Vel: {velocity_y}");
y += velocity_y;

// Get the layer
var lay_id = layer_get_id("Level");

// See if we hit a wall.
var interect_floor = 
	tilemap_get_at_pixel(lay_id, bbox_left, bbox_bottom) ||
	tilemap_get_at_pixel(lay_id, bbox_right, bbox_bottom) ||
	tilemap_get_at_pixel(lay_id, bbox_left, bbox_top) ||
	tilemap_get_at_pixel(lay_id, bbox_right, bbox_top);

// Check for wall
var intersect_wall = 
    tilemap_get_at_pixel(lay_id, bbox_left - 1, bbox_top + 1) ||  // Top-left corner
    tilemap_get_at_pixel(lay_id, bbox_right + 1, bbox_top + 1) || // Top-right corner
    tilemap_get_at_pixel(lay_id, bbox_left - 1, bbox_bottom - 1) || // Bottom-left corner
    tilemap_get_at_pixel(lay_id, bbox_right + 1, bbox_bottom - 1); // Bottom-right corner

if (intersect_wall) {
    x = oldX;
}


if(interect_floor)
{
	y = oldY;
	velocity_y = 0;
}
