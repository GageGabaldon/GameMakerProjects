/// @description Insert description here
// You can write your code in this editor
checkBot = tilemap_get_at_pixel(collision, x, y + spriteradius);
checkTop = tilemap_get_at_pixel(collision, x, y - spriteradius);

updatePoints();
is_collision = checkCollisions();

if(keyboard_check(ord("W")) && !is_collision && canMove)
{
	if(checkTop == 0)
	{
		if(obj_controller.gamePhase >= 2)
		{
			// play sound
		}
		y -= 1 * movementSpeed;
	}
	
}

if(keyboard_check(ord("S")) && !is_collision && canMove)
{
	if(checkBot == 0)
	{
		if(obj_controller.gamePhase >= 2)
		{
			// play sound
		}
		y += 1 * movementSpeed;
	}
}
if (obj_controller.gamePhase >= 3)
	{
		movementSpeed = 8;
	}