/// @description Insert description here
// You can write your code in this editor
bounceWall();

if(obj_controller.gamePhase >= 1)
{
	with(other)
	{
		bounceWall();
	}
}
