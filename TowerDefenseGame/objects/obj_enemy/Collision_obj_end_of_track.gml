/// @description Insert description here
// You can write your code in this editor
if (global.player_hp > 0)
{
	global.player_hp -= 2;
	instance_destroy();
}
else
{
	global.player_hp = 0;
	//transition back to main menu or something
}