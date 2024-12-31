/// @description Insert description here
// You can write your code in this editor
collision_defined = true;


// This code gets run when a player touches us
function on_collision(player) {
	
	// Send the signal if its not in there
	if(!array_contains(global.signal, signal))
	{
		array_push(global.signal, signal);
	}
}
	