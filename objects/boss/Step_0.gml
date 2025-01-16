/// @description Insert description here
// You can write your code in this editor

attack_cooldown -= delta_time / 1000000;

if(attack_cooldown > 0)
{
	return;
}
	
	
if(global.boss_stage == BOSS_STAGE.TWITTER)
{
	obj_camera.look_at(560, 320);
	
	instance_create_layer(672, 144, "Instances", obj_notification, {target_y: target_locations[wave_count]});


	wave_count++;	
	attack_cooldown = 0.6;
	
	if(wave_count == array_length(target_locations))
	{
		wave_count = 0;
		global.boss_stage = BOSS_STAGE.START;
		
		boss.attack = true;
		obj_camera.look_at(360, 320);
		obj_camera.camera_speed = 0.6;
	}
}