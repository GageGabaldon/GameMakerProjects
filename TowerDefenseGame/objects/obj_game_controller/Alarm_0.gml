/// @description Insert description here
// You can write your code in this editor
if(spawned_counter < enemy_amount)
{
	instance_create_depth(x,y,-1,obj_enemy);
	spawned_counter++;
	alarm[0] = spawn_rate;
}