/// @description Insert description here
// You can write your code in this editor
if (col = c_white)
{
	instance_destroy();
    instance_create_depth(mouse_x,mouse_y,-1,obj_tower3);
	global.gold -= obj_tower3_click.cost;
}