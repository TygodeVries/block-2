/// @description Insert description here
// You can write your code in this editor
goal = {x: x, y: target_y};
audio_play_sound(so_twitter_notification_sound, 10, false, 0.2);

animation_time = 0;

trigger_defined = true;
// This code will run when one of the player touches us
function on_trigger(player)
{
	player.murder_and_kill();
}