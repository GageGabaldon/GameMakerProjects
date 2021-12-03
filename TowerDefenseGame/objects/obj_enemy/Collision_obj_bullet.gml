/// @description Insert description here
// You can write your code in this editor
var enemy = self;
with(other)
{
	enemy.hp -= 20;
	enemy.effectDuration = effectDuration;
	m_send(enemy.fsm, damageType);
	
	instance_destroy();
}