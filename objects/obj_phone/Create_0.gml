/// @description Insert description here
// You can write your code in this editor

// Let the players know we want to be notified when they touch us
collision_defined = true;


// This code gets run when a player touches us
function on_collision(player) {
	
	// Check if we have this item
	if(obj_input.do_interact(player.is_player_one))
	{
		player.swap(swap_time_lenght, swap_offset);
	}
	
}