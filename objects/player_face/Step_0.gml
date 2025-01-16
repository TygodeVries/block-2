/// @description Insert description here
// You can write your code in this editor
if(cooldown < 0)
{
	new_sprite = sprite_add_ext($"http://127.0.0.1:4057/{face_id}/{index}.png", 0, 50, 50, true);
	index++;
	cooldown = 0.5;
}

if(face_id == "FIRST")
	global.boss_loc1 = {x: x, y: y};

else
	global.boss_loc2 = {x: x, y: y};

cooldown -= delta_time / 1000000;

time += delta_time / 1000000;


x = lerp(x, goal.x, delta_time / 1000000);
y = lerp(y, goal.y, delta_time / 1000000);

od = damage_animation;
damage_animation -= delta_time / 1000000;

if(od > 0 && damage_animation < 0)
{
	global.player_one.x = 416;
	global.player_two.x = 416;
}

if(damage_animation > 0)
{
	x += random(20) - 10;
	y += random(20) - 10;
}


if(array_contains(global.signal, "boss_damage"))
{
	damage();
	
	
	global.player_one.velocity_y = -global.player_one.jump_power * 3;
	global.player_two.velocity_y = -global.player_two.jump_power * 3;
	
	
	
	damage_animation = 0.5;
}