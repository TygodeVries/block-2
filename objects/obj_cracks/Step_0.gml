/// @description Insert description here
// You can write your code in this editor
if(signal != "none")
{
	if(array_contains(global.signal, signal))
	{
		
	}	
}

crack();
function crack()
{
	var _fx_struct = layer_get_fx("Breaking_Bad");

	var _params = fx_get_parameters(_fx_struct);
	_params.g_DistortTexture = crack_texture;
	
	for(var _h = 0; _h < 12; _h++)
	{
		gamepad_set_vibration(_h, 1, 1)
		stop_shake_in = 0.3;
	}	
	fx_set_parameters(_fx_struct, _params);

}

stop_shake_in -= delta_time / 1000000;

if(stop_shake_in < 0 && stop_shake_in > -1)
{
	for(var _h = 0; _h < 12; _h++)
	{
		gamepad_set_vibration(_h, 0, 0);
	}	
	
	stop_shake_in = -2;
}