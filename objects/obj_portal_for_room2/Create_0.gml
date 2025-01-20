
collision_defined = true;


// This code gets run when a player touches us
function on_collision(player)
{
	room_goto(lv_ending);
}
