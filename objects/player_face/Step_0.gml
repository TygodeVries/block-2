/// @description Insert description here
// You can write your code in this editor
if(cooldown < 0)
{
	new_sprite = sprite_add_ext($"http://127.0.0.1:4057/{face_id}/{index}.png", 0, 50, 50, true);
	index++;
	cooldown = 0.5;
}

cooldown -= delta_time / 1000000;

time += delta_time / 1000000;

if(global.boss_stage == BOSS_STAGE.IDEL)
{
	offset = 0;
	if(is_face_one)
		offset = 1;
	
	goal.x = (cos(((time / 10) + offset) * pi) * 200) + 256;
	goal.y = (sin(((time / 10) + offset) * pi) * 200) + 256;
}


if(global.boss_stage == BOSS_STAGE.EAT)
{
	goal.x += 3;
	if(goal.x > 632)
	{
		global.boss_stage = BOSS_STAGE.IDEL;
	}
	
}

x = lerp(x, goal.x, delta_time / 1000000);
y = lerp(y, goal.y, delta_time / 1000000);