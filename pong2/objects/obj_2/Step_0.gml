/// @description Insert description here
// You can write your code in this editor
if(wait < waitTotal)
{
	wait += 1;
}
else if(wait == 80)
{
}
else 
{
	image_blend = make_color_rgb(irandom(255),irandom(255),irandom(255));
	if(!ok)
	{
		audio_play_sound(pong_collision, 9, false);
		shake_time -= 1; 
		var _xval = choose(-shake_magnitude, shake_magnitude); 
		var _yval = choose(-shake_magnitude, shake_magnitude); 
		camera_set_view_pos(view_camera[0], _xval, _yval); 

		if (shake_time <= 0) 
		{ 
			shake_magnitude -= shake_fade; 

		if (shake_magnitude <= 0) 
		{ 
			camera_set_view_pos(view_camera[0], 0, 0); 
			ok = true;
			instance_create_layer(textx - 100, texty + 300, "Instances", obj_start);
		} 
		} 
	}

	if(ok && !played)
	{
		played = true;
		audio_play_sound(snd_phase3, 2, true);
	}
} 