/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_enemy_boss))
{
	final_level = true;
}

if(final_level == true)
{
	if(!instance_exists(obj_enemy_boss))
	{
		room_goto(rm_win);
	}
}

if (instance_number(obj_enemy) <= 0)
{
	spawned_counter = 0;
	enemy_amount++;	
	global.level++;
	global.hp += 20;
	global.spd += 0.12;
	spawn_rate -= 2.8;
	show_debug_message("New Wave");
	
	alarm[0] = spawn_rate;
}

alarm[1] = room_speed * 5;