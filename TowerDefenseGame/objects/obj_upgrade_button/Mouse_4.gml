/// @description Insert description here
// You can write your code in this editor
if (col = c_white)
{
	audio_play_sound(snd_upgrade,6,false);
	global.gold -= 50;
	global.clicked_tower.range += 10;
	global.clicked_tower.criticalChance += 1;
	global.clicked_tower.bulletDamage += 3;
	global.clicked_tower.effectDuration += 0.1;
	global.clicked_tower.attack_speed /= 1.1;
}