// Move on the X axis
function move_on_x()
{
	if(ob_input.do_left(is_player_one)) velocity_x = -move_speed; // Move left
	else if(ob_input.do_right(is_player_one)) velocity_x = move_speed // Move right
	else velocity_x = 0; // Don't move

	move_and_collide(velocity_x, 0, our_tilemap);
}

// Move on the Y axis
function move_on_y()
{
	velocity_y += gravity_modifier;
	var _collisions = move_and_collide(0, velocity_y, our_tilemap);
	// _collisions is the list of things we are colliding with

	if(array_length(_collisions) > 0)
	{
		// If we are touching anything
		on_ground = true;
		velocity_y = 0;
	}
	else
	{
		on_ground = false;
	}
}

function try_jump()
{
	if(ob_input.do_jump(is_player_one) && on_ground)
	{
		velocity_y = -jump_power;
	}
}

move_on_x();
try_jump();
move_on_y();

if(is_player_one)
{
	global.player_one = {x: x, y: y};
}
else
{
	global.player_two = {x: x, y: y};
}