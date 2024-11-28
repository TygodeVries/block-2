cooldown_one -= delta_time / 1000000;
if(cooldown_one > 0.0)
{
	return;
}

real_x = lerp(real_x, camera_x, delta_time / 1000000 * 4);
real_y = camera_y;


camera_set_view_pos(view_camera[0], round(real_x), round(real_y));


if(global.player_one.is_getting_dragged || global.player_two.is_getting_dragged)
{
	return;
}

var bleh = camera_get_view_width(view_camera[0]);

/// Some very shitty code! But ah well, it works for now.


if(global.player_one.x > camera_x + bleh)
{	
	teleport_to_checkpoints(0, 0, global.player_two, global.player_one);
	camera_x += bleh;
	return;
}

if(global.player_two.x > camera_x + bleh)
{
	
	teleport_to_checkpoints(0, 0, global.player_one, global.player_two);
	camera_x += bleh;
	return;
}

if(global.player_one.x < camera_x) 
{
	teleport_to_checkpoints(0, 0, global.player_two, global.player_one);
	camera_x -= bleh;
	return;
}

if(global.player_two.x < camera_x)
{
	teleport_to_checkpoints(0, 0, global.player_one, global.player_two);
	camera_x -= bleh;
	return;
}


function teleport_to_checkpoints(_y_offset_one, _y_offset_two, _player, _other_player)
{
	
	// Find the nearest checkpoint to the other player
	var _checkpoint_one = instance_nearest(_other_player.x, _other_player.y + _y_offset_one, ob_checkpoint_p1);
	var _checkpoint_two = instance_nearest(_other_player.x, _other_player.y + _y_offset_two, ob_checkpoint_p2);
	
	if(_player.is_player_one)
	{
		_player.goal_x = _checkpoint_one.x;
		_player.goal_y = _checkpoint_one.y + 8;
		_player.is_getting_dragged = true;
		
		cooldown_one = distance(_player.goal_x, _player.goal_y, _player.x, _player.y) / 300;
		return;
	}
	
	if(!_player.is_player_one)
	{
		_player.goal_x = _checkpoint_two.x;
		_player.goal_y = _checkpoint_two.y + 8;
		_player.is_getting_dragged = true;
		cooldown_one = distance(_player.goal_x, _player.goal_y, _player.x, _player.y) / 300;
		return;
	}
	
	
}