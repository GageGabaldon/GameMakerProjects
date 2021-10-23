/// @description Insert description here
// You can write your code in this editor

if(player == 2 && !done)
{
	gamePhase = 1;
	obj_wall.gamePhase = 1;
	obj_ball.gamePhase = 1;
	audio_play_sound(snd_phase1, 3, true);
	done = true;
}
else if(player == 4 && !done2)
{
	gamePhase = 2;
	obj_wall.gamePhase = 2;
	obj_ball.gamePhase = 2;
	//obj_ball.sprite_index = spr_ball_cool;
	audio_pause_sound(snd_phase1);
	audio_play_sound(snd_phase2, 3, true);
	done2 = true;
}