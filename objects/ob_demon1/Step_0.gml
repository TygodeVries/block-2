/// @description Auto follow ob_player
// Speed factor (adjust this to control speed)
var speed_factor = 0.2;

// Find the nearest ob_player
var target = instance_nearest(x, y, ob_player);

// Check if target exists
if (target != noone) {
    // Move towards target with controlled speed
    pos_x = sign(target.x - x) * walk_speed * speed_factor;
    pos_y = sign(target.y - y) * walk_speed * speed_factor;

    move_and_collide(pos_x, pos_y, all);

    // Change sprite based on direction
    if (pos_x > 0) sprite_index = sp_demon1_right;
    if (pos_x < 0) sprite_index = sp_demon1_left;
    if (pos_y > 0) sprite_index = sp_demon1_down;
    if (pos_y < 0) sprite_index = sp_demon1_up;
}
