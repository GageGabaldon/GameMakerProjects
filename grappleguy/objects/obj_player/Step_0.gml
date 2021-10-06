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
	self.sprite_index = spr_player_walk_left;
	my_direction = "left";
	if(checkSideLeft == 0)
	{
		x -= 2; // decrease to go left
		image_speed = walkSpeed/25; // smooth out movement
	}

}
if(keyboard_check(ord("D")))
{
	self.sprite_index = spr_player_walk_right;
	my_direction = "right";
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

if(mouse_check_button_released(mb_left))
{
	checkMouse = tilemap_get_at_pixel(collision, mouse_x, mouse_y);
		
	if(checkMouse > 0)
	{
		distance = point_distance(self.x, self.y, mouse_x, mouse_y);
		if(distance < grappleLimit)
		{
			// tween from position to poistion and change sprite
			TweenEasyMove(x, y, mouse_x, mouse_y, 3, 10, EaseInBounce);
		}
		else 
		{
			// play miss animation
		}
	}
}

// if we collide with an enemy
// TO DO: trigger die title, do not allow movement
if (place_meeting(x, y, obj_enemy))
{
	if (my_direction == "left")
	{
		spr_index = spr_playerhurt_left;
	}
	else
	{
		spr_index = spr_playerhurt_right;	
	}
	
	
	
	
}