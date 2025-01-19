// Create a variable to track the current background music
if (!variable_global_exists("current_bgm")) {
    global.current_bgm = -1; // -1 means no music is playing
}

// Check the room and play the right music
if (room == menu_main || room == menu_rebind || room == menu_select_character || room == menu_settings || room == menu_sound) 
{
    if (global.current_bgm != so_op_bgm) { 
        audio_stop_all(); // Stop all music
        audio_play_sound(so_op_bgm, 0, true); // Play menu music
        global.current_bgm = so_op_bgm; // Update current music
    }
    else if (!audio_is_playing(so_op_bgm)) {
        // If music stopped, restart it
        audio_play_sound(so_op_bgm, 0, true);
    }
}

if (room == lv_room1 || room == lv_room2 || room == lv_new_intro)
{
    if (global.current_bgm != so_bgm1) { 
        audio_stop_all(); // Stop all music
        audio_play_sound(so_bgm1, 0, true); // Play level music
        global.current_bgm = so_bgm1; // Update current music
    }
}

if (room == lv_boss)
{
    if (global.current_bgm != so_boss_bgm) { 
        audio_stop_all(); // Stop all music
        audio_play_sound(so_boss_bgm, 0, true); // Play boss music
        global.current_bgm = so_boss_bgm; // Update current music
    }
}

if (room == lv_ending)
{
    if (global.current_bgm != so_ed_bgm) { 
        audio_stop_all(); // Stop all music
        audio_play_sound(so_ed_bgm, 0, true); // Play ending music
        global.current_bgm = so_ed_bgm; // Update current music
    }
}
