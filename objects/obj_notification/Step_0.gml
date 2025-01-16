/// @description Insert description here
// You can write your code in this editor
y = lerp(y, goal.y, delta_time / 1000000);
animation_time += delta_time / 1000000;

if(animation_time > 1.5)
{
	if(hspeed > -6)
	{
		hspeed -= 0.3;
	}
}