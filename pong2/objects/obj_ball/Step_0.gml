/// @description Insert description here
// You can write your code in this editor
checkGoal = tilemap_get_at_pixel(goal, x, y);
checkEnemyGoal = tilemap_get_at_pixel(enemy_goal, x, y);
if(safe <= safeBounce)
{
	safe += 1;
}

if(checkGoal > 0)
{
	obj_player_line.goal_point += 1;
	audio_play_sound(snd_score, 1, 0);
	reset();
}

if(checkEnemyGoal > 0)
{
	obj_enemy_line.goal_point += 1;
	audio_play_sound(snd_score, 1, 0);
	reset();
}

if(battleStart == true && dead == false)
{
	// trigger guitar sound
	audio_play_sound(snd_guitar, 1, 0);
	// shoot bullet at player
	
	
}

if(dead != true && health <= 0)
{
	dead = true;
	// create death sequence at place of death
	layer_sequence_create(layer_get_id("boss_battle"), x, y, seq_phase4_boss_death)
}

// if player bullet has hit enemy bullet
if (hit )
{
	health -= 1;
	audio_play_sound(boss_growl, 1, 0);
}