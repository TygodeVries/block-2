// This codes gets run onces when the key is created.

// We let the players know they should let us know when they touch us.
collision_defined = true;


// This code will run when one of the player touches us
function on_collision(player)
{
	if(state == ITEM_STATE.IN_WORLD)
	{
		// If the player is player one
		player.add_to_inventory(item_type)
	
		state = ITEM_STATE.FOLLOW;
		solid = false; // Disable collision
		owner = player;
	}
}

enum ITEM_STATE {
	IN_WORLD,
	FOLLOW
}


if(state == ITEM_STATE.FOLLOW)
{
	var _distance = distance_to_object(owner);
	if(_distance > 30 * owner.get_inventory_index(item_type))
	{
		var _delta_x = (owner.x) - x;
		var _delta_y = (owner.y - 8) - y;
		
		if(abs(_delta_x) > 1)
			_delta_x = sign(_delta_x);
		
		if(abs(_delta_y) > 1)
			_delta_y = sign(_delta_y);
		
		x += _delta_x * (_distance * 0.05);
		y += _delta_y * (_distance * 0.05);
	}
}


if(state == ITEM_STATE.FOLLOW)
{
	if(!owner.has_in_inventory(item_type)){
		instance_destroy(self);
	}
}