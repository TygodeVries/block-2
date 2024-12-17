/// @description Insert description here
// You can write your code in this editor
// Start with no player on the plate
var player_on_plate = noone;

// Look if player one is on the plate
if (place_meeting(x, y, global.player_one)) {
    player_on_plate = global.player_one;
}

// Look if player two is on the plate
if (place_meeting(x, y, global.player_two)) {
    player_on_plate = global.player_two;
}

// If there's a player on the plate
if (player_on_plate != noone) {
    // Say the plate is pressed
    plate1pressed = true;
    
    // Change the wind for the player on the plate
    if (player_on_plate == global.player_one) {
        // Slowly make the wind stronger for player one
        global.wind_player1 = lerp(global.wind_player1, -100, 0.1);
    } else {
        // Slowly make the wind stronger for player two
        global.wind_player2 = lerp(global.wind_player2, -100, 0.1);
    }
} else {
    // If no player is on the plate
    plate1pressed = false;
    
    // Slowly make the wind go back to normal for both players
    global.wind_player1 = lerp(global.wind_player1, 0, 0.1);
    global.wind_player2 = lerp(global.wind_player2, 0, 0.1);
}
////////////////////////Wind Movement////////////////////////
// Check position, change direction
if (x <= 1000) direction = 0; // Move right
else if (x >= 1400) direction = 180; // Move left

// Update position
x += lengthdir_x(windspeed, direction)
//////////////////////////////////////////////////////////////