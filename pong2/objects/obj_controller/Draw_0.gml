/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_enemy_line) && instance_exists(obj_player_line))
{
	enemy = obj_enemy_line.goal_point;
	player = obj_player_line.goal_point;
	

	
	if (gamePhase<=2)
	{
		draw_text(scoreboardx, scoreboardy, string(enemy));
		draw_text(score2x, score2y, string(player));	
	}
	else
	{
		scoreboardy = centerPos + sin(timer*frequency)*amplitude;
		score2y = centerPos + sin(timer*frequency)*amplitude;
		timer++;
		color1 = make_color_rgb(irandom(255),irandom(255),irandom(255));
		color2 = make_color_rgb(irandom(255),irandom(255),irandom(255));
		color3 = make_color_rgb(irandom(255),irandom(255),irandom(255));
		color4 = make_color_rgb(irandom(255),irandom(255),irandom(255));
		draw_text_colour(scoreboardx, scoreboardy, string(enemy), color1, color2, color3, color4, 1);
		draw_text_colour(score2x, score2y, string(player), color1, color2, color3, color4, 1);
		
	}
}