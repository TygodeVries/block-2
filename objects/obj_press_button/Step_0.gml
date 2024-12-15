/// @description Insert description here
// You can write your code in this editor

if(visible)
{
for( var i = 32; i <= 591; ++i){
    if( keyboard_check( i)){
        obj_rebind_handle.add(programming, $"k_{i}");
		room_restart();
		return;
    }
}
for( var i = vk_left; i <= vk_down; ++i){
    if( keyboard_check( i)){
        obj_rebind_handle.add(programming, $"k_{i}");
		room_restart();
		return;
    }
}
}