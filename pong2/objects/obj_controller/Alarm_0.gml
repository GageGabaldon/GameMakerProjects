// wait for boss sequence
// move paddles to center of board
// move enemy paddle 
with (obj_enemy_line)
{
	if (point_distance(x, y, obj_controller.player_x - 50, obj_controller.player_y) > 1)
	{
		move_towards_point(obj_controller.boss_x + 50, obj_controller.player_y, 10);
	}
	else
	{
		speed = 0;
	}	
}
// move player paddle (100 pixels to right)
with (obj_player_line)
{
	if (point_distance(x, y, obj_controller.player_x + 50, obj_controller.player_y) > 1)
	{
		move_towards_point(obj_controller.boss_x - 50, obj_controller.player_y, 10);
	}
	else
	{
		speed = 0;
	}	
}

// wait for sequences to finish, then create objects
if (alarm[1] < 0)
{
	alarm[1] = 0.5 * room_speed;
}
