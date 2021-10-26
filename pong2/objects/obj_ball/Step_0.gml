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