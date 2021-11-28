/// @description Insert description here
// You can write your code in this editor
draw_self();
if (global.gold >= cost)
{
	draw_set_color(c_black);
}
else
{
	draw_set_color(c_red);
}

draw_text(x-16,y+15,"$"+string(cost));