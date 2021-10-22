/// @description Insert description here
// You can write your code in this editor
bounceWall();
audio_play_sound(pong_collision, 1, 0);

if(obj_controller.gamePhase == 1)
{
	with(other)
	{
		bounceWall();
	}
}
