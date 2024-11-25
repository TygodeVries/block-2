/// @description Insert description here
// You can write your code in this editor

var oldX = x;
var oldY = y;
var grafity = -0.1;

velocity_y = velocity_y - grafity;

if(keyboard_check(vk_up))
{
	velocity_y = -3;
	y -= 3;
}

if(keyboard_check(vk_left))
{
	x += 3;
}

if(keyboard_check(vk_right))
{
	x -= 3;
}


show_debug_message($"Vel: {velocity_y}");
y += velocity_y;

// Get the layer
var lay_id = layer_get_id("Level");

// See if we hit a wall.
var interect_floor = 
	tilemap_get_at_pixel(lay_id, bbox_left, bbox_bottom) ||
	tilemap_get_at_pixel(lay_id, bbox_right, bbox_bottom);

// Check for wall
var intersect_wall = 
    tilemap_get_at_pixel(lay_id, bbox_left, bbox_top) ||  // Top-left corner
    tilemap_get_at_pixel(lay_id, bbox_right, bbox_top) || // Top-right corner
    tilemap_get_at_pixel(lay_id, bbox_left, bbox_bottom - 1) || // Bottom-left corner
    tilemap_get_at_pixel(lay_id, bbox_right, bbox_bottom - 1); // Bottom-right corner

if (intersect_wall) {
    x = oldX;
}


if(interect_floor)
{
	y = oldY;
	velocity_y = 0;
}
