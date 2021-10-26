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
	gamePhase = 4;
	obj_wall.gamePhase = 4;
	obj_ball.gamePhase = 4;
	audio_pause_sound(snd_phase3);
	audio_play_sound(snd_phase4, 3, true);
	
	// move ball to top of screen
	move_towards_point(20, 20, 5);
	// remove ball object
	instance_destroy(obj_ball);
	// play change to boss sequence
	layer_sequence_create(layer_get_id("phase4_seqences"), 20, 40, seq_boss_creation);
	// create boss object 
	instance_create_layer(20, 40, layer_get_id("boss_and_player_instances"), obj_boss);
	
	
	// move paddles to center of board
	obj_enemy_line.combinePaddles();
	obj_player_line.combinePaddles();
	// trigger sequence of them merging together, remove paddle objects
	instance_destroy(obj_enemy_line);
	instance_destroy(obj_player_line);
	layer_sequence_create(layer_get_id("phase4_sequences"), 20, 20, seq_phase4_teamup);
	// create ship object
	instance_create_layer(x, y, layer_get_id("boss_and_player_instances"), obj_player_ship);
	
	// go to room that has an identical start to this rooms end
	room_goto(rm_final_phase)
	done4 = true;
}
