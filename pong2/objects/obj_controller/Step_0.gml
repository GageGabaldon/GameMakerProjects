/// @description Insert description here
// You can write your code in this editor
if(player == 2 && !done)
{
	obj_ball.image_blend = c_red;
	audio_play_sound(snd_phase1, 3, true);
	done = true;
}
else if(player == 4)
{
	obj_ball.sprite_index = spr_pulsating_ball;
	audio_pause_sound(snd_phase1);
}