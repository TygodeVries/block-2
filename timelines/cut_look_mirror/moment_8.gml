obj_camera.zoom(0.6);
obj_camera.look_at(792, 180)
global.player_one.x = 792;
global.player_two.x = 792;
global.player_one.visible = true;
array_push(global.signal, "stop_look_in_mirror");
