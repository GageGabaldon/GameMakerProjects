/// @description Insert description here
// You can write your code in this editor
if (instance_exists(object_to_shoot))
{
	var bullet = instance_create_depth(x,y,-9,obj_bullet);
	bullet.image_blend = c_aqua;
	var critical = irandom_range(criticalFloor, criticalMax);
	if(critical < criticalChance)
	{
		bullet.damageType = self.damageType;
		bullet.damageNum = self.bulletDamage;
	}
	bullet.speed = bulletSpeed;
	bullet.direction = point_direction(x,y,object_to_shoot.x,object_to_shoot.y);
	alarm[0] = attack_speed;
}
else
{
	is_attacking = false;
}