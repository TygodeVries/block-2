
_mod = 0.8;
if(speedup_time > 0)
{
	_mod = 2.5;
}

if(swap_time < 0 && swap_time > -1)
{
	swap_time = -2;
	gravity_modifier = -gravity_modifier; 
	jump_power = -jump_power;
	
	image_yscale = -image_yscale;
	x = swap_loc.x;
	y = swap_loc.y;
}


swap_time -= (delta_time / 1000000);
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
	velocity_x = -move_speed + wind_effect + slow_effect;
	
	//Update sprite
	sprite_index = spr_player_walk;
	
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
	velocity_x = move_speed + wind_effect - slow_effect;
	
	// Update sprite 
	sprite_index = spr_player_walk;
	
	// We need to check wich player we have as one is upside down.
	if(is_player_one)
			image_xscale = 1; 
			
	if(!is_player_one)
			image_xscale = -1;
}

function move_stop()
{
	// Make us stop moving
	  velocity_x = wind_effect;
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
	if(obj_input.do_jump(is_player_one) && time_since_ground < 0.1)
	{
		time_since_ground = 1000;
		// This one is pretty simple, we just overwrite the velocity of the player.
		velocity_y = -jump_power;	
	}
	
	
}





/// Restart funtion(press R)
if keyboard_check_pressed(ord("R"))
{
room_restart();
}


if keyboard_check_pressed(vk_escape)
 {
    game_restart();
}

// Handle triggers
triggerlist = ds_list_create();
var num = instance_place_list(x, y, all, triggerlist, true);
for(var _ble = 0; _ble < num; _ble++)
{
	var _trigger_object = triggerlist[| _ble];
	
	if (instance_exists(_trigger_object) && _trigger_object != noone) {			
		// Check if they want to know that we collided
		if(variable_instance_exists(_trigger_object, "trigger_defined"))
		{
			// Let them know we collided, and with who.
			_trigger_object.on_trigger(self);
		}
	}
}

ds_list_destroy(triggerlist);
	

// Avoid bug
if(delta_time / 1000000 > 0.1)
{
	show_debug_message($"Window was dragged! {delta_time / 1000000}")
	return;
}


if(global.player_one.is_dead && global.player_two.is_dead)
{
	game_over();
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

if(!global.freezemotion)
{
	move_on_x();
	jump();
}
else
{
	move_stop();
}


move_on_y();

	if(on_ground)
	{
		time_since_ground = 0;
	}
	else
	{
		time_since_ground += delta_time / 1000000;
	}

	if(!on_ground)
	{
		time_since_air = 0;
	}
	else
	{
		time_since_air += delta_time / 1000000;
	}


}

//Animations
//idle
if velocity_x == 0 && time_since_ground<0.1 { sprite_index = spr_player_idle; };

if time_since_ground<1 && time_since_ground>0.01 
	{
		sprite_index = spr_player_fall;
		image_index = 3;	
	}

GetAirSprite()
function GetAirSprite()
{
	if time_since_ground>0.1 
	{
		if(velocity_y<0)
		{
			sprite_index = spr_player_jump;
			image_index = 1;
			image_speed = 0;
		}
		
		if(velocity_y<-5)
		{
			sprite_index = spr_player_jump;
			image_index = 2;
			image_speed = 1;	
		}
		
		if (velocity_y>0)
		{
		sprite_index = spr_player_fall;
		image_speed = 1
		if(image_index == 3)
		{
			image_index = 0
		}
		
		}
	
	}
	
	else
	{
		sprite_index=spr_player_idle;
		image_speed=1;
	}
	
}


//moving platform collision 
var _movingPlatform = instance_place(x, y + max(1, vspeed), obj_movingplatformdream) || instance_place(x, y + max(1, vspeed), obj_movingplatformreality);

if(_movingPlatform && bbox_bottom <= _movingPlatform.bbox_top) {
	if(vspeed > 0) {
		while (!place_meeting(x, y + sign(vspeed), obj_movingplatformdream)) || (!place_meeting(x, y + sign(vspeed), obj_movingplatformreality)) {
			y += sign(vspeed);
		}
		vspeed = 0;
	}
	x += _movingPlatform.hspeed;
	y += _movingPlatform.vspeed;
}
//moving platform collision 
var _movingPlatform = instance_place(x, y + max(1, vspeed), obj_movingplatformdream) || instance_place(x, y + max(1, vspeed), obj_movingplatformreality);

if(_movingPlatform && bbox_bottom <= _movingPlatform.bbox_top) {
	if(vspeed > 0) {
		while (!place_meeting(x, y + sign(vspeed), obj_movingplatformdream)) || (!place_meeting(x, y + sign(vspeed), obj_movingplatformreality)) {
			y += sign(vspeed);
		}
		vspeed = 0;
	}
	x += _movingPlatform.hspeed;
	y += _movingPlatform.vspeed;
}

