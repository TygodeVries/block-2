/// @description Insert description here
// You can write your code in this editor
move_right=keyboard_check(vk_right);
move_left=keyboard_check(vk_left);
move_up=keyboard_check(vk_up);
move_down=keyboard_check(vk_down);

pos_x=(move_right - move_left) * walk_speed;
pos_y=(move_up - move_down) * walk_speed;

if (pos_x !=0 || pos_y!=0)
{
	
	move_and_collide(pos_x, -pos_y, all);
	
}

{
	if(pos_x >0)
	{
		sprite_index = Sprite_Right
	}
	if(pos_x <0)
	{
		sprite_index = Sprite_Left
	}
	
	if(pos_y >0)
	{
		sprite_index = Sprite_Up
	}
	if(pos_y <0)
	{
		sprite_index = Sprite_Down
	}
}