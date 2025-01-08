/// @description Insert description here
// You can write your code in this editor
collision_defined = true;

// Collision cooldown time (in frames)
cooldown_time = 10; // Time to wait before collision can happen again
collision_cooldown = 0; // Start with no cooldown

// Code for collision event
function on_collision(player) {
    if (collision_cooldown <= 0) { // Check if cooldown is ready
        player.murder_and_kill(); // Kill the player
        collision_cooldown = cooldown_time; // Reset cooldown
    }
}

// In the Step event, handle cooldown timer
if (collision_cooldown > 0) { // If cooldown is active
    collision_cooldown -= 1; // Reduce cooldown time
}