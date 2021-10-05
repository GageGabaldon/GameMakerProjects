/// @description step event for player

//check collisions
checkBot = tilemap_get_at_pixel(collision, x, bbox_bottom);
checkSideLeft = tilemap_get_at_pixel(collision, x - spriteradius, y + spriteradius);
checkSideLeft += tilemap_get_at_pixel(collision, x - spriteradius, y - spriteradius);
checkSideRight = tilemap_get_at_pixel(collision, x + spriteradius, y + spriteradius);
checkSideRight += tilemap_get_at_pixel(collision, x + spriteradius, y - spriteradius);

// check if falling
if((checkBot + checkSideLeft + checkSideRight) == 0)
{
	y += 2;
	if(!m_is_state(fsm, "fall"))
	{
		m_send(fsm, "falling");
	}
	grappingWall = false;
	show_debug_message("falling");
}
else if(checkSideLeft > 0)
{
	show_debug_message("Left collide");
	// change sprite
	grappingWall = true;
	m_send(fsm, "sticking");
	
}
else if (checkSideRight > 0)
{
	show_debug_message("Right collide");
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
	if(checkSideRight == 0)
	{
		x -= 2; // decrease to go left
		image_speed = walkSpeed/25; // smooth out movement
	}

}
if(keyboard_check(ord("D")))
{
	if(checkSideLeft == 0)
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
			y -= jumpHeight;
			m_send(fsm, "falling");
		}
	}
}

if(keyboard_check(ord("F")))
{
	checkMouse = tilemap_get_at_pixel(collision, mouse_x, mouse_y);
	if(checkMouse > 0)
	{
		distance = point_distance(self.x, self.y, mouse_x, mouse_y);
		if(distance < grappleLimit)
		{
			// tween from position to poistion and change sprite
		}
		else 
		{
			// play miss animation
		}
	}

}

if(keyboard_check(ord("S")) && checkBot == 0)
{
	y+=2;
}