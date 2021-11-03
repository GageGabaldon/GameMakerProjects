

// if boss isnt dead or injured and the battle is on, shoot bullet & chase player
if(battleOn == true && dead == false && injured == false)
{
	player_x = obj_player_ship.x;
	player_y = obj_player_ship.y;
	
	// if we just finished a blink, stop blinking
	if (blinking == true && image_index == image_number)
	{
		blinking = false;
		sprite_index = spr_boss;	
	}
	
	// wait random amount of time before blinking
	if (alarm[2] < 0)
	{
		alarm[2] = random_range(3, 6) * room_speed;
	}

	// if boss just lost 10 health points
	if (lost_health == 25)
	{
		sprite_index = spr_boss_shield
		injured = true;
		speed = 0;
		lost_health = 0;
		// have injured boss idle before chasing player again
		if (alarm[1] < 0)
		{
			alarm[1] = 3 * room_speed;
		}
	}
	else
	{
		// shoot bullet at random
		if (alarm[0] < 0)
		{
			alarm[0] = random_range(0.1, 1) * room_speed;
		}
		// chase player
		if (obj_player_ship.dead == false)
		{
			move_towards_point(player_x, player_y, boss_speed);
		}
		else
		{
			speed = 0;
		}
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
	visible = false;
	sequence = layer_sequence_create(layer_get_id("phase4_sequences"), x, y, seq_phase4_boss_death);
	audio_sound_gain(snd_phase4, 0, 5000);
	// wait for sequence to be finished before leaving room
	if (alarm[3] < 0)
	{
		alarm[3] = 35 * room_speed;
	}

}
