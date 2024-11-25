/// @description Insert description here
// You can write your code in this editor
global.input_p1_left = false;
global.input_p1_right = false;
global.input_p1_jump = false;

global.input_p2_left = false;
global.input_p2_right = false;
global.input_p2_jump = false;

function do_jump(_player_one)
{
	if(_player_one && global.input_p1_jump) return true;
	if(!_player_one && global.input_p2_jump) return true;
	return false;
}

function do_left(_player_one)
{
	if(_player_one && global.input_p1_left) return true;
	if(!_player_one && global.input_p2_left) return true;
	return false;
}

function do_right(_player_one)
{
	if(_player_one && global.input_p1_right) return true;
	if(!_player_one && global.input_p2_right) return true;
	return false;
}