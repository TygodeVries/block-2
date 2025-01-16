/// @description Insert description here
// You can write your code in this editor

global.boss_stage = BOSS_STAGE.TWITTER;
attack_cooldown = 0;
wave_count = 0;

enum BOSS_STAGE {
	START,
	TWITTER,
	EAT
}


attack = false;


target_locations = [400, 295, 192]


obj_camera.in_cutscene_mode = true;
obj_camera.look_at(390, 320);