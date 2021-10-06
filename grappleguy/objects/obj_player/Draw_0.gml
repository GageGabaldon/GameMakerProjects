/// @description Insert description here
// You can write your code in this editor
draw_self();

if (active)
{

	draw_line(x,y,mx,my);
	if(my_direction == "right")
	{
		draw_sprite(spr_hook_right, 1, mx, my);
	}
	else 
	{
		draw_sprite(spr_hook_left, 1, mx, my);
	}
}