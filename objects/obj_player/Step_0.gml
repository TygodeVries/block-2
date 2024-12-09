
_mod = 0.8;
if(speedup_time > 0)
{
	_mod = 2.5;
}
death_cooldown -= (delta_time / 1000000) * _mod;
speedup_time -= (delta_time / 1000000)
// We run this code every frame
function step_and_handle_collide(steps_x, steps_y)
{
	// We need to make a list of things the player wants to be able to collide with
	var _colliders = [];
	
	// We want to be able to collide with our tilemap, so we add it to the list
	_colliders[0] = level_tilemap;

	// We also want to be able to collide with all solid objects, so we add those to the list aswell
	for (var _i = 0; _i < instance_count; _i++) {
		var _object_instance = instance_find(all, _i);
		if (_object_instance != noone && instance_exists(_object_instance) && _object_instance.solid) {
			_colliders[array_length(_colliders)] = _object_instance; // Append instance to the array
		}
	}
	
	// We acually move.
	var _collisions = move_and_collide((steps_x * delta_time / 1000000 * 50) + 0.000001, steps_y * delta_time / 1000000 * 50, _colliders);
	
	// After we have moved, we notify every objects that wants to know that we collided with it
	for(_j = 0; _j < array_length(_collisions); _j++)
	{
		_colliding_object = _collisions[_j];
		
		// Check if the object exists (to avoid some errors)
		if (instance_exists(_colliding_object) && _colliding_object != noone) {
				
				// Check if they want to know that we collided
				if(variable_instance_exists(_colliding_object, "collision_defined"))
				{
					// Let them know we collided, and with who.
					_colliding_object.on_collision(self);
				}
		}
	}
	
	
	// If we are touching any object, them return true.
	if(array_length(_collisions) > 0)
	{
		return true;
	}
	
	return false;
}


// Makes the character walk left until move_stop() is called
function move_left()
{
	// Set the velocity of the player, The velocity is the 'speed' the player moves at.
	velocity_x = -move_speed;
	
	// We need to check wich player we have as one is upside down.
	if(is_player_one)
			image_xscale = -1; 
			
	if(!is_player_one)
			image_xscale = 1;
}

// Makes the character walk right until move_stop() is called
function move_right()
{
	// Set the velocity of the player, The velocity is the 'speed' the player moves at.
	velocity_x = move_speed;
	
	// Update sprite 
	
	// We need to check wich player we have as one is upside down.
	if(is_player_one)
			image_xscale = 1; 
			
	if(!is_player_one)
			image_xscale = -1;
}

function move_stop()
{
	// Make us stop moving
	velocity_x = 0
}

// Move on the X axis
// This function will handle walking.
function move_on_x()
{
	// If the player inputs the left button
	if(obj_input.do_left(is_player_one)) {
		 move_left();
	}
	
	// If the player inputs the right button
	else if(obj_input.do_right(is_player_one))
	{
		move_right();	
	}
	
	// If we are pressing no buttons, stop moving
	else
	{
		move_stop();
	}
	
	_collided_with_wall = step_and_handle_collide(velocity_x, 0);
}

// Move on the Y axis
// This function will handle falling
function move_on_y()
{
	// Apply gravity!
	velocity_y += gravity_modifier * delta_time / 1000000 * 50;
	
	// Move
	_collided_with_ground = step_and_handle_collide(0, velocity_y);
	
	// Check if we are colliding with anything
	if(_collided_with_ground)
	{		
		
		// Check if we are going up (relative to our world)
		if(velocity_y * sign(-gravity_modifier) <= 0)
		{
			// Say that we are now standing on the ground
			on_ground = true;
		}
		else
		{
			// We hit something, but are going up! so its probebly the roof.
			// The roof is not the ground, so lets set on_ground to false.
			on_ground = false;
		}
		
		// Set the velocity to 0, because we hit the floor or roof
		velocity_y = 0;
	}
	else
	{
		// If we are not colliding with anything, we set onground to false
		on_ground = false;
	}
}

// Make the characher jump.
function jump()
{
	// Check if the player is pressing the jump button, and that we are standing on the ground
	if(obj_input.do_jump(is_player_one) && on_ground)
	{
		// This one is pretty simple, we just overwrite the velocity of the player.
		velocity_y = -jump_power;
	}
}

// Avoid bug
if(delta_time / 1000000 > 0.1)
{
	show_debug_message($"Window was dragged! {delta_time / 1000000}")
	return;
}


if(global.player_one.is_dead && global.player_two.is_dead)
{
	room_restart();
}
		

if(death_cooldown > 0)
{
	// Death
	
	var _x = cos(((death_cooldown / 5) * 2) * pi);
	var _y = sin(((death_cooldown / 5) * 2) * pi);
	
	x = death_location.x + (_x * 30);
	y = death_location.y + (_y * 30);
	
	var ob = instance_create_layer(x, y, "Instances", obj_trail);
	array_push(particles, ob);
	if(speedup_time > 0)
	{
		ob.image_index = 1;
	}
	
	if(obj_input.do_jump(is_player_one))
	{
		speedup_time = 0.1;
	}
	
	
}
else {
	
	if(is_dead)
	{
		revive();
		
		for(_i = 0; _i < array_length(particles); _i++)
		{
			instance_destroy(particles[_i]);
		}
		
		particles = [];
	}
	
// Make sure to move in the right order
move_on_x();
jump();
move_on_y();

}