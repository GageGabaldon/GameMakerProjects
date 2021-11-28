/// @description Insert description here
// You can write your code in this editor
if (global.player_hp > 0 && global.player_hp - 10 > 0)
{
	global.player_hp -= 10;
	instance_destroy();
}
else
{
	room_goto(rm_main_menu);
	//transition back to main menu or something
}