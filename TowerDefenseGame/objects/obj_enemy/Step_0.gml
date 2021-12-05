/// @description Insert description here
// You can write your code in this editor
if (hp <= 0)
{
	global.gold += 10;
	instance_destroy()
}

if(damageOverTime)
{
	hp -= 1;
}

image_angle = direction - 180;