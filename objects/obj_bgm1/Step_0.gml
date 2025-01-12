// In the game's initialization script or Create event

//Play bgm1
if (!audio_is_playing(so_bgm1)) {
    audio_play_sound(so_bgm1, 0, true);
}

//Stop another bgm
if (room == lv_boss || room == lv_new_intro || room == lv_room1 || room == lv_test) {
    if (audio_is_playing(so_op_bgm)) {
        audio_stop_sound(so_op_bgm);
    }
    if (audio_is_playing(so_ed_bgm)) {
        audio_stop_sound(so_ed_bgm);
    }
}