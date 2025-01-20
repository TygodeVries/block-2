/// @description Insert description here
// You can write your code in this editor

// Let the players know we want to be notified when they touch us
trigger_defined = true;


// This code gets run when a player touches us
function on_trigger(player) {
	
	// Check if we have this item
	if(obj_input.do_interact(player.is_player_one) && player.swap_time < 0)
	{
		behind_instance = instance_create_layer(x, y, layer, obj_phone_behind);
		player.swap(swap_time_lenght, swap_offset);
		
		behind_instance.image_angle = image_angle;
	}
}