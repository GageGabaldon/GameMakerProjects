/// @description step event for player

//check collisions
checkBot = tilemap_get_at_pixel(collision, x, y + spriteBotRadius);
checkSideLeft = tilemap_get_at_pixel(collision, x - spriteradius, y + spriteradius);
checkSideLeft += tilemap_get_at_pixel(collision, x - spriteradius, y - spriteradius);
checkSideRight = tilemap_get_at_pixel(collision, x + spriteradius, y + spriteradius);
checkSideRight += tilemap_get_at_pixel(collision, x + spriteradius, y - spriteradius);

// check if falling
if((checkBot + checkSideLeft + checkSideRight) == 0)
{
	y += 3;
	if(!m_is_state(fsm, "fall"))
	{
		m_send(fsm, "falling");
	}
	grappingWall = false;
}
else if(checkSideLeft > 0)
{
	// change sprite
	grappingWall = true;
	m_send(fsm, "sticking");
	
}
else if (checkSideRight > 0)
{
	// change sprite
	grappingWall = true;
	m_send(fsm, "sticking");
}
else {
	grappingWall = false;
	if(!m_is_state(fsm, "stand"))
	{
		m_send(fsm, "standing");
	}
}


if(keyboard_check(ord("A")))
{
	if(checkSideLeft == 0)
	{
		x -= 2; // decrease to go left
		image_speed = walkSpeed/25; // smooth out movement
	}

}
if(keyboard_check(ord("D")))
{
	if(checkSideRight == 0)
	{
		x += 2; // decrease to go left
		image_speed = walkSpeed/25; // smooth out movement
	}
}

if(keyboard_check(vk_space))
{
	if(!m_is_state(fsm, "fall"))
	{
		if(!grappingWall)
		{
			TweenEasyMove(x, y, x, y - jumpHeight, 0, 10, EaseOutElastic);
			m_send(fsm, "falling");
		}
	}
}

if(keyboard_check(ord("W")))
{
	if(grappingWall)
	{
		y -= 2; // decrease to go left
		image_speed = walkSpeed/25; // smooth out movement
	}
}


if(keyboard_check(ord("S")) && checkBot == 0)
{
	y+=2;
}