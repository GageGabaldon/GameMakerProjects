/// @description Insert description here
// You can write your code in this editor
draw_self();

if (mouse_x > (x - sprite_width / 2) && mouse_x < x + sprite_width)
{
	if (mouse_y > (y - sprite_height / 2) && mouse_y < y + sprite_width)
	{
		draw_set_color(c_black);
		draw_circle(x,y,range,true);
	}
}

var enemy = instance_nearest(x,y,obj_enemy);

if (enemy != noone)
{
	if (point_distance(x,y,enemy.x,enemy.y) <= range + 16)
	{
		if (!is_attacking)
		{
			alarm[0] = 1;
			is_attacking = true;
		}
		object_to_shoot = enemy;
	}
	else
	{
		is_attacking = false;
		object_to_shoot = noone;
	}
}