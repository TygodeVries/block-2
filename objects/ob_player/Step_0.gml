// Move on the X axis
function move_on_x()
{
	old_x = x;
	if(ob_input.do_left(is_player_one)) {
		velocity_x = -move_speed; // Move left
		
		if(is_player_one)
			image_xscale = 1; // Flip
			
		if(!is_player_one)
			image_xscale = -1; // Flip
	}
	else if(ob_input.do_right(is_player_one))
	{
		velocity_x = move_speed // Move right
		if(is_player_one)
			image_xscale = -1; // Flip
			
		if(!is_player_one)
			image_xscale = 1; // Flip
		
	}
	else velocity_x = 0; // Don't move

	var _colliders = []; // Create an array for colliders
	_colliders[0] = our_tilemap; // Add the tilemap as the first collider

	// Loop through all instances in the room
	for (var _i = 0; _i < instance_count; _i++) {
		var _object_instance = instance_find(all, _i);
		if (_object_instance != noone && instance_exists(_object_instance) && _object_instance.solid) {
			_colliders[array_length(_colliders)] = _object_instance; // Append instance to the array
		}
	}

	var _collisions = move_and_collide(velocity_x * delta_time / 1000000 * 50, 0, _colliders);
	
	
	for(_j = 0; _j < array_length(_collisions); _j++)
	{
		
		_aobj = _collisions[_j];
		if (instance_exists(_aobj) && _aobj != noone) {
				
				if(variable_instance_exists(_aobj, "collision_defined"))
				{
					_aobj.on_collision(self);
				}
			}
	}
}

// Move on the Y axis
function move_on_y()
{
	old_y = y;
	velocity_y += gravity_modifier * delta_time / 1000000 * 50;
	
	var _colliders = [];
	_colliders[0] = our_tilemap; // Add the tilemap as the first collider

	for (var _i = 0; _i < instance_count; _i++) {
		var _object_instance = instance_find(all, _i);
		if (_object_instance != noone && instance_exists(_object_instance) && _object_instance.solid) {
			_colliders[array_length(_colliders)] = _object_instance;
		}
	}
	
	var _collisions = move_and_collide(0, velocity_y * delta_time / 1000000 * 50, _colliders);
	// _collisions is the list of things we are colliding with

	// Check if we are colliding with anything
	if(array_length(_collisions) > 0)
	{		
		// Manually call collision, as our implementation skips this.
		for (var _j = 0; _j < array_length(_collisions); _j++) 
		
		var _aobj = _collisions[_j];
			if (instance_exists(_aobj) && _aobj != noone) {
				
				if(variable_instance_exists(_aobj, "collision_defined"))
				{
					_aobj.on_collision(self);
				}
			}
		
		
		// Check if we are going up (relative to our world)
		if(velocity_y * sign(-gravity_modifier) <= 0)
		{
			on_ground = true;
		}
		else
		{
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

// Make the characher jump if the player wants to
function try_jump()
{
	// Check if we can jump
	if(ob_input.do_jump(is_player_one) && on_ground)
	{
		// Apply upwards force
		velocity_y = -jump_power;
	}
}

// Avoid bug
if(delta_time / 1000000 > 0.1)
{
	show_debug_message($"Window was dragged! {delta_time / 1000000}")
	return;
}

if(is_getting_dragged)
{
	x = lerp(x, goal_x, delta_time / 1000000 * 5);
	y = lerp(y, goal_y, 0.05);
	
	_distance = distance(x, y, goal_x, goal_y);
	show_debug_message($"goal_x: {goal_x}, goal_y: {goal_y}");
	if(_distance < 2)
	{
		x = goal_x;
		y = goal_y;
		
		is_getting_dragged = false;
	}
	
	return;
}

// Make sure to move in the right order
move_on_x();
try_jump();
move_on_y();

function my_lerp(a, b, t)
{
	return a + (b - a) * t;
}

function distance(ax, ay, bx, by)
{
    var a = abs(ax - bx);
    var b = abs(ay - by);


    return sqrt(a * a + b * b);
}
