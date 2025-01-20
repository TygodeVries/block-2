/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
trigger_defined = true;


// This code gets run when a player touches us
function on_trigger(player) {
	
	// Send the signal if its not in there
	if(!array_contains(global.signal, signal))
	{
		array_push(global.signal, signal);
	}
}
	