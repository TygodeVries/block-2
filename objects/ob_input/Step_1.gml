function array_key_down(a)
{
	for(i = 0; i < array_length(a); i++)
	{
		if(keyboard_check(a[i]))
		{
			return true;
		}
	}
	
	return false;
}

global.input_p1_left = array_key_down(input_p1_left);
global.input_p1_right = array_key_down(input_p1_right);
global.input_p1_jump = array_key_down(input_p1_jump);

global.input_p2_left = array_key_down(input_p2_left);
global.input_p2_right = array_key_down(input_p2_right);
global.input_p2_jump = array_key_down(input_p2_jump);
