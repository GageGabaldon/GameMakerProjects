/// @description Insert description here
// You can write your code in this editor

checkBot = tilemap_get_at_pixel(collision, x, y + spriteradius);
checkTop = tilemap_get_at_pixel(collision, x, y - spriteradius);

updatePoints();
is_collision = checkCollisions();

if(obj_ball.y > y && !is_collision)
{	
	if(checkBot == 0)
	{
		y += 1 * movementSpeed;
	}
}

else if(obj_ball.y < y && !is_collision)
{
	if(checkTop == 0)
	{
		y -= 1 * movementSpeed;	
	}
}