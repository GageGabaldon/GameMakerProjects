/// @description Insert description here
// You can write your code in this editor

if (instance_number(obj_enemy) <= 0 && waveDone)
{
	if(global.level == 25 && global.rm == 1)
	{
		room_goto(rm_win);
	}
	spawned_counter = 0;
	enemy_amount++;	
	global.level++;
	waveDone = false;
	if(global.rm == 2)
	{
		global.hp += 40;
		global.spd += 0.175;
	}
	else 
	{
		global.hp += 30;
		global.spd += 0.125;
	}
	if(spawn_rate > 2)
	{
		spawn_rate -= 1;
	}
	show_debug_message("New Wave");
	
	alarm[0] = spawn_rate;
}

alarm[1] = room_speed * 5;