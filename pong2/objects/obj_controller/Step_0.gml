
if(player == 1 && !done4)
{
	// player can no longer move 
	obj_player_line.canMove = false;
	//play sequnces play rooms and setup for moving rooms
	gamePhase = 4;
	obj_wall.gamePhase = 4;
	obj_ball.gamePhase = 4;
	audio_pause_sound(snd_phase3);
	audio_play_sound(snd_phase4, 3, true);
	
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
