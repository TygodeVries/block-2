if keyboard_check(vk_up)  or keyboard_check(ord("W")) 
{
    jumping = true; // Player is jumping
} else {
    jumping = false; // Player is not jumping
}

// Play or stop the jumping sound
if (jumping) {
    if (!audio_is_playing(so_jump)) {
        audio_play_sound(so_jump, 1, true, global.sound_master); // Start jumping sound
    }
} else {
    if (audio_is_playing(so_jump)) {
        audio_stop_sound(so_jump); // Stop jumping sound
    }
}
