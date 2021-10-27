/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_enemy_line) && instance_exists(obj_player_line))
{
	enemy = obj_enemy_line.goal_point;
	player = obj_player_line.goal_point;
	draw_text(scoreboardx, scoreboardy, string(enemy));
	draw_text(score2x, score2y, string(player));	
}