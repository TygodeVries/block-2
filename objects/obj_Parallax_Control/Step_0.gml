var _cx = camera_get_view_x(view_camera[0]); //gets the camera x position
//check if the keys have been held down.
//if pressed, we get the speed we want the camera to move at by multiplying the values of the keybord check by 3
var _xspd = 3 * (keyboard_check(vk_right) - keyboard_check(vk_left));
_cx += _xspd
camera_set_view_pos(view_camera[0], _cx, 0); //to apply it to the current camera position to move the camera

var _b = ds_map_find_first(background_map);
repeat(ds_map_size(background_map))
    {
    layer_x(_b, background_map[? _b] * _cx);
    _b = ds_map_find_next(background_map, _b);
    }