/// @description Insert description here
// You can write your code in this editor
new_sprite = -1;
cooldown = 0;

global.boss_loc1 = {x: x, y: y};
global.boss_loc2 = {x: x, y: y};

index = 0;

is_face_one = false;

if(face_id == "FIRST")
{
	is_face_one = true;
}

time = 0;

goal = {x: x, y: y};


my_health = 3;

function damage()
{
	my_health--;
	if(my_health == 0)
	{
		room_goto(menu_main);
	}
}

damage_animation = 0;