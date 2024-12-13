var player_on_plate = noone;

if (place_meeting(x, y, global.player_one)) {
    player_on_plate = global.player_one;
}

if (place_meeting(x, y, global.player_two)) {
    player_on_plate = global.player_two;
}

if (player_on_plate != noone) {
    plate1pressed = true;
    if (player_on_plate == global.player_one) {
        global.wind_player1 = lerp(global.wind_player1, -100, 0.1);
    } else {
        global.wind_player2 = lerp(global.wind_player2, -100, 0.1);
    }
} else {
    plate1pressed = false;
    global.wind_player1 = lerp(global.wind_player1, 0, 0.1);
    global.wind_player2 = lerp(global.wind_player2, 0, 0.1);
}