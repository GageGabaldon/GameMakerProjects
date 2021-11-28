/// @description Insert description here
// You can write your code in this editor
if (instance_number(obj_enemy) <= 0)
{
	spawned_counter = 0;
	enemy_amount++;
	
	global.level++;
	global.hp += 15;
	global.spd += 0.1;
	spawn_rate -= 2.5;
	alarm[0] = spawn_rate;
}

alarm[1] = room_speed * 5;