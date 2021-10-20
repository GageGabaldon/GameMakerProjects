/// @description Insert description here
// You can write your code in this editor
checkBot = tilemap_get_at_pixel(collision, x, y + spriteradius);
checkTop = tilemap_get_at_pixel(collision, x, y - spriteradius);

updatePoints();
is_collision = checkCollisions();

if(keyboard_check(ord("W")) && !is_collision)
{
	if(checkTop == 0)
	{
		y -= 1 * movementSpeed;
	}
	
}

if(keyboard_check(ord("S")) && !is_collision)
{
	if(checkBot == 0)
	{
		y += 1 * movementSpeed;
	}
}