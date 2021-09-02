// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function toggle_once(light){
	if(light == noone)  return;
	with(light){
		if(sprite_index == spr_light_on) sprite_index = spr_light_off;
		else sprite_index = spr_light_on;
	}
}

function toggle(light){
	toggle_once(light);
	toggle_once(light.left);
	toggle_once(light.right);
	toggle_once(light.up);
	toggle_once(light.down);
}