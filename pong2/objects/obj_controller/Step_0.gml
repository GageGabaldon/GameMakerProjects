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

if(player == 4 && !done2)
{
	gamePhase = 2;
	obj_wall.gamePhase = 2;
	obj_ball.gamePhase = 2;
	//obj_ball.sprite_index = spr_ball_cool;
	audio_pause_sound(snd_phase1);
	audio_play_sound(snd_phase2, 3, true);
	done2 = true;
}

if(player == 6 && !done3)
{
	gamePhase = 3;
	obj_wall.gamePhase = 3;
	obj_ball.gamePhase = 3;
	//obj_ball.sprite_index = spr_ball_cool;
	audio_pause_sound(snd_phase2);
	audio_play_sound(snd_phase3, 3, true);
	done3 = true;
}

if(player == 8 && !done4)
{
	//play sequnces play rooms and setup for moving rooms
}