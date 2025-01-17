/// @description Ensure sprite fills the entire window
// You can write your code in this editor

var spr_width = sprite_get_width(spr_dreamworld_cut);
var spr_height = sprite_get_height(spr_dreamworld_cut);



// Get the window dimensions
var window_width = display_get_gui_width();
var window_height = display_get_gui_height();

// Calculate scaling factors to fit the window
var scale_x = window_width / spr_width;
var scale_y = window_height / spr_height;

// Draw the sprite scaled to fit the entire window
draw_sprite_ext(
    spr_dreamworld_cut, 
    0, 
    0, 
    0, 
    scale_x, 
    scale_y, 
    0, 
    c_white, 
    a
);
