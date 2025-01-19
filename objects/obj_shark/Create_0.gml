// Trigger setup
trigger_defined = true;
cooldown_time = 300; // Wait time in frames
trigger_cooldown = 0; // Starts with no cooldown

// Runs when the player touches the trigger
function on_trigger(player) {
    if (trigger_cooldown <= 0) { // If cooldown is over
        player.murder_and_kill(); // Kill the player
        show_debug_message("Shark!"); // Debug message
        trigger_cooldown = cooldown_time; // Reset cooldown
    }
}