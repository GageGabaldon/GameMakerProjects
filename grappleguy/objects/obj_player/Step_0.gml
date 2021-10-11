/// @description step event for player

//check collisions
checkBot = tilemap_get_at_pixel(collision, x, y + spriteBotRadius);
checkSideLeft = tilemap_get_at_pixel(collision, x - spriteradius, y + spriteradius);
checkSideLeft += tilemap_get_at_pixel(collision, x - spriteradius, y - spriteradius);
checkSideRight = tilemap_get_at_pixel(collision, x + spriteradius, y + spriteradius);
checkSideRight += tilemap_get_at_pixel(collision, x + spriteradius, y - spriteradius);
checkSideUp = tilemap_get_at_pixel(collision, x, y - spriteBotRadius);

if(wait >= waitLimit)
{
	self.image_alpha = 1;
}
else{
	wait += 1;
}
// check if falling
if((checkBot + checkSideLeft + checkSideRight) == 0 && !m_is_state(fsm, "grapple"))
{
	grappleMovement = 0;
	if(wait >= 90)
	{
		if(my_direction == "right")
		{
			sprite_index = spr_right_fall;
		}
		else 
		{
			sprite_index = spr_left_fall;
		}
		y += 2;
	}

	if(!m_is_state(fsm, "fall"))
	{
		m_send(fsm, "falling");
	}
	grappingWall = false;
}
else if(m_is_state(fsm, "grapple"))
{

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
	if(my_direction == "right")
	{
		self.sprite_index = spr_player_right;
	}
	else 
	{
		self.sprite_index = spr_player_left;
	}
}

if(keyboard_check(ord("A")))
{
	if(m_is_state(fsm, "grapple"))
	{
		sprite_index = spr_grapple_left;
	}
	else 
	{
	  self.sprite_index = spr_player_walk_left;
	}
	
	my_direction = "left";
	if(checkSideLeft == 0 && grappleMovement > -grappleMovementLimit && wait >= waitLimit)
	{
		if(m_is_state(fsm, "grapple"))
		{
			grappleMovement -= 2;
		}
		x -= 2; // decrease to go left
		image_speed = walkSpeed/25; // smooth out movement
	}

}
if(keyboard_check(ord("D")))
{
	if(m_is_state(fsm, "grapple"))
	{
		sprite_index = spr_grapple_right;
	}
	else 
	{
	  self.sprite_index = spr_player_walk_right;
	}

	my_direction = "right";
	if(checkSideRight == 0 && grappleMovement < grappleMovementLimit && wait >= waitLimit)
	{
		if(m_is_state(fsm, "grapple"))
		{
			grappleMovement += 2;
		}

		x += 2; // decrease to go left
		image_speed = walkSpeed/25; // smooth out movement
	}
}

if(keyboard_check(vk_space))
{
	if(!m_is_state(fsm, "fall"))
	{
		if(!grappingWall && !m_is_state(fsm, "grapple"))
		{
			TweenEasyMove(x, y, x, y - jumpHeight, 0, 10, EaseOutSine);
			m_send(fsm, "falling");
		}
	}
}

if(keyboard_check(ord("W")))
{
	if(grappingWall && checkSideUp == 0)
	{
		y -= 2; // decrease to go left
		image_speed = walkSpeed/25; // smooth out movement
	}
}


if(keyboard_check(ord("S")) && checkBot == 0)
{
	if(grappingWall && checkBot == 0)
	{
		y += 2; // decrease to go down
	}
}

// grapple to a point
if(mouse_check_button_pressed(mb_left))
{
	checkMouse = tilemap_get_at_pixel(collision, mouse_x, mouse_y);
	
	mx = mouse_x;
	my = mouse_y;
	
	// if mouse is not at a non grapple tile
	if(checkMouse > 0)
	{
		active = true;
		distance = point_distance(self.x, self.y, mouse_x, mouse_y);
		
		m_send(fsm, "grappling");
		
		// if within grapple range
		if(distance < grappleLimit)
		{
			if(my_direction = "right")
			{
				sprite_index = spr_grapple_right;
			}
			else
			{
				sprite_index = spr_grapple_left;
			}
			angle = point_direction(x, y, mouse_x, mouse_y);
			while(collide == 0)
			{
				linemarch += 1;
				if(linemarch > grappleLimit )
				{
					break;
				}
				notCollide_x = x + lengthdir_x(linemarch, angle);
				notCollide_y = y + lengthdir_y(linemarch, angle);
				
				collide = tilemap_get_at_pixel(collision, notCollide_x, notCollide_y - spriteBotRadius);
				collide += tilemap_get_at_pixel(collision, notCollide_x - spriteradius, y - (spriteradius - 2));
				collide += tilemap_get_at_pixel(collision, notCollide_x + spriteradius, y - (spriteradius - 2));
			}
			
			linemarch = 0;
			collide = 0;
			// tween from position to poistion and change sprite
			TweenEasyMove(x, y, notCollide_x, notCollide_y, 0, 8, EaseOutSine);
		}
		else 
		{
			// play miss animation
		}
	}
}

// when the mouse is released release grapple
if (mouse_check_button_released(mb_left))
{
	active = false;
	grappleMovement = 0;
	if(checkSideLeft > 0 || checkSideRight > 0)
	{
		m_send(fsm, "sticking");
	}
	else if (checkBot > 0 )
	{
		m_send(fsm, "standing");
	}
	else
	{
		m_send(fsm, "falling");
	}
}