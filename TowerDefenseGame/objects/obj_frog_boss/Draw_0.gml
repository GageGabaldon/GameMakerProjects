/// @description Insert description here
// You can write your code in this editor
draw_self();
fly = instance_nearest(x,y,obj_fly_dead);

if (fly != noone)
{
	if(!is_attacking)
	{
		sprite_index = spr_frog_open;
		draw_line(x, y, fly.x, fly.y);
		alarm[0] = 2;
		is_attacking = true;
	}
	
}