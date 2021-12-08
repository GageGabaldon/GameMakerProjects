/// @description Insert description here
// You can write your code in this editor
if (hp <= 0)
{
	global.gold += 10;
	instance_create_depth(x,y,-1,obj_fly_dead);
	instance_destroy()
}

if(damageOverTime)
{
	hp -= 1;
}

if(path_position == 1)
{
	switch(global.rm)
	{
		case 1: path_start(Path1,global.spd,0,1); break;
		case 2: path_start(Path2,global.spd,0,1); break;
	}
}

image_angle = direction - 180;