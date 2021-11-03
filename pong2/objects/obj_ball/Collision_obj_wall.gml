/// @description Insert description here
// You can write your code in this editor
bounceWall();

if(obj_controller.gamePhase >= 1)
{
	with(other)
	{
		bounceWall();
		if (gamePhase >= 3)
		{
			part_particles_create(global.P_System, obj_ball.x, obj_ball.y, global.Particle1, 50);
		}
		
	}
}
