
// if boss isnt dead yet and the battle is going on, shoot bullet
if(battleOn == true && dead == false)
{
	player_x = obj_player_ship.x;
	player_y = obj_player_ship.y;
	// trigger guitar sound
	audio_play_sound(snd_guitar, 1, 0);
	// shoot bullet every 5 seconds
	if (alarm[0] < 0)
	{
		alarm[0] = random_range(0.1, 1)*room_speed;
	}
}

// if boss just died
if(dead == false && hp <= 0)
{
	dead = true;
	// stop battle
	battleOn = false;
	obj_player_ship.battleOn = false;
	// create death sequence at place of death
	instance_destroy(self);
	sequence = layer_sequence_create(layer_get_id("phase4_sequences"), x, y, seq_phase4_boss_death)
}
