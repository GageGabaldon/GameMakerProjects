/// @description Insert description here
// You can write your code in this editor
var enemy = self;
with(other)
{
	if(enemy.moredmg)
	{
		enemy.hp -= damageNum * 2;
	}
	else 
	{
		enemy.hp -= damageNum;
	}
	
	enemy.effectDuration = effectDuration;
	
	m_send(enemy.fsm, damageType);
	instance_destroy();
}