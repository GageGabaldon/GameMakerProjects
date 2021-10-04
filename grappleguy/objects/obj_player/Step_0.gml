/// @description Insert description here
// You can write your code in this editor
checkBot = tilemap_get_at_pixel(collision, x, bbox_bottom);
checkSideLeft = tilemap_get_at_pixel(collision, x - spriteradius, y + spriteradius);
checkSideLeft += tilemap_get_at_pixel(collision, x - spriteradius, y - spriteradius);
checkSideRight = tilemap_get_at_pixel(collision, x + spriteradius, y + spriteradius);
checkSideRight += tilemap_get_at_pixel(collision, x + spriteradius, y - spriteradius);

if((checkBot + checkSideLeft + checkSideRight) == 0)
{
	y += 2;
	if(!m_is_state(fsm, "falling"))
	{
		m_send(fsm, "falling");
	}
	grappingWall = false;
}
else if(checkSideLeft > 0)
{
	// change sprite
	grappingWall = true;
	m_send(fsm, "wall");
	
}
else if (checkSideRight > 0)
{
	// change sprite
	grappingWall = true;
	m_send(fsm, "wall");
}
else {
	grappingWall = false;
	if(!m_is_state(fsm, "standing"))
	{
		m_send(fsm, "stand");
	}
}


if(keyboard_check(ord("A")))
{
	x -= 2; // decrease to go left
	image_speed = walkSpeed/25; // smooth out movement
}
if(keyboard_check(ord("D")))
{
	x += 2; // decrease to go left
	image_speed = walkSpeed/25; // smooth out movement
}

if(keyboard_check_pressed(vk_space))
{
	
}

if(keyboard_check(ord("S")))
{
	y+=2;
}