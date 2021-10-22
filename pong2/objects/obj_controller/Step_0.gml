/// @description Insert description here
// You can write your code in this editor

if(player == 2)
{
	if(instance_exists(obj_ball))
	{
		obj_ball.image_blend = make_color_rgb(irandom(255),irandom(255),irandom(255));;
	}
}

if(player == 2 && !done)
{
	gamePhase = 1;
	obj_ball.image_blend = c_red;
	audio_play_sound(snd_phase1, 3, true);
	done = true;
}
else if(player == 4 && !done)
{
	gamePhase = 2;
	obj_ball.sprite_index = spr_pulsating_ball;
	audio_pause_sound(snd_phase1);
	done2 = true;
}