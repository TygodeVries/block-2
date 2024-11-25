/// @description Insert description here
// You can write your code in this editor

var oldX = x;
var oldY = y;
var grafity = -0.1;

vY -= grafity;

if(keyboard_check(vk_up))
{
	vY = 10;
	y -= 3;
}

x += vX;
y += vY;

// Get the layer
var lay_id = layer_get_id("Level");

// See if we hit a wall.
var interect = tilemap_get_at_pixel(lay_id, bbox_left, bbox_top) ||
	tilemap_get_at_pixel(lay_id, bbox_right, bbox_top) ||
	tilemap_get_at_pixel(lay_id, bbox_left, y) ||
	tilemap_get_at_pixel(lay_id, bbox_right, y) ||
	tilemap_get_at_pixel(lay_id, bbox_left, bbox_bottom) ||
	tilemap_get_at_pixel(lay_id, bbox_right, bbox_bottom) ||
	tilemap_get_at_pixel(lay_id, x, y);

if(interect)
{
	x = oldX;
	y = oldY;
	vY = 0;
}