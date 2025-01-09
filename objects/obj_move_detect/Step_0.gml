/// @description Step Event
// Check if the player is moving
if (keyboard_check(vk_down) || keyboard_check(vk_left) || keyboard_check(vk_right)) {
    moving = true; // Player is moving
} else {
    moving = false; // Player is not moving
}

// Play or stop the footstep sound
if (moving) {
    if (!audio_is_playing(so_footstep)) {
        audio_play_sound(so_footstep, 1, true); // Start footstep sound
    }
} else {
    if (audio_is_playing(so_footstep)) {
        audio_stop_sound(so_footstep); // Stop footstep sound
    }
}


if keyboard_check(vk_up) 
{
    jumping = true; // Player is jumping
} else {
    jumping = false; // Player is not jumping
}

// Play or stop the jumping sound
if (jumping) {
    if (!audio_is_playing(so_jump)) {
        audio_play_sound(so_jump, 1, true); // Start jumping sound
    }
} else {
    if (audio_is_playing(so_jump)) {
        audio_stop_sound(so_jump); // Stop jumping sound
    }
}
