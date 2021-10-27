
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
	audio_pause_sound(snd_phase3);
    audio_play_sound(snd_phase4, 3, true);
	// player can no longer move 
	obj_player_line.canMove = false;
	//play sequnces play rooms and setup for moving rooms
	gamePhase = 4;
	obj_wall.gamePhase = 4;
	obj_ball.gamePhase = 4;
	audio_pause_sound(snd_phase3);
	audio_play_sound(snd_phase4, 3, true);
	
	TweenEasyMove(obj_ball.x, obj_ball.y, boss_x, boss_y, 0, 5, EaseInOutSine);
	
	instance_destroy(obj_ball);
	// play change to boss sequence 670, 127
	seq_bosscreation = layer_sequence_create("phase4_sequences", boss_x, boss_y, seq_phase4_boss_creation);
	
	// wait until finished, continue
	if (alarm[0] < 0)
	{
		alarm[0] = 20 * room_speed;
	}
	
	// go to room that has an identical start to this rooms end
	//room_goto(rm_final_phase)
	done4 = true;
}
