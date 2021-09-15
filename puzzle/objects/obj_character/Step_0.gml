// if player near truck
if (distance_to_object(obj_truckOpen) < 100)
{
	nearTruck = true;
}
else
{
	nearTruck = false;	
}


if (boxBeingHeld != noone)
{
	boxBeingHeld.x = mouse_x;
	boxBeingHeld.y = mouse_y;
	if(keyboard_check_pressed(ord("E")))
	{
		boxBeingHeld.image_angle += 90;
	}
	else if(keyboard_check_pressed(ord("Q")))
	{
		boxBeingHeld.image_angle -= 90;
	}
}

// if character tries to pick up a box
if (!characterHasBox && keyboard_check_pressed(ord("F")))
{	
	// find what box is within maximum distance and pick it up
	for (i = 0; i < allBoxesSize; i++)
	{
		potentialBox = allBoxes[i];
		if (distance_to_object(potentialBox) < characterBoxDistance)
		{
			characterHasBox = true;
			boxBeingHeld = potentialBox;
			boxBeingHeld.image_alpha = .5;
			// if character was facing right
			if (sprite_index == spr_characterIdleR || 
							sprite_index == spr_characterWalkingR)
			{
				sprite_index = spr_characterIdleBoxR
			}
			else
			{
				sprite_index = spr_characterIdleBoxL
			}
			
			// we found a box, do not look for more boxes.
			break;
		}
	}

}


// if character drops a box
if (characterHasBox && keyboard_check_pressed(ord("X")))
{	
	characterHasBox = false;
	boxBeingHeld.x = obj_character.x
	boxBeingHeld.y = obj_character.y
	boxBeingHeld.image_alpha = 1;
	boxBeingHeld = noone;
	// if character was facing right
	if (sprite_index == spr_characterIdleBoxR || 
					sprite_index == spr_characterWalkingBoxR)
	{
		sprite_index = spr_characterIdleR
	}
	else
	{
		sprite_index = spr_characterIdleL
	}
}


// if a player stops moving while facing left IDLE
if (keyboard_check_released(ord("A")))
{
	image_speed = walkSpeed/50; // smooth out movement
	if (characterHasBox)
	{
		sprite_index = spr_characterIdleBoxL
	}
	else
	{
		sprite_index = spr_characterIdleL
	}
}

// if a player stops moving while facing right IDLE
if (keyboard_check_released(ord("D")))
{
	image_speed = walkSpeed/50; // smooth out movement
	if (characterHasBox)
	{
		sprite_index = spr_characterIdleBoxR
	}
	else
	{
		sprite_index = spr_characterIdleR
	}
}

// if player tries to move left
if (keyboard_check(ord("A")))
{
	x -= walkSpeed; // decrease to go left
	image_speed = walkSpeed/25; // smooth out movement
	if (characterHasBox)
	{
		sprite_index = spr_characterWalkingBoxL
	}
	else
	{
		sprite_index = spr_characterWalkingL
	}
}

// if player tries to move right
if (keyboard_check(ord("D")))
{
	x += walkSpeed; // increase to go right
	image_speed = walkSpeed/25; // smooth out movement
	if (characterHasBox)
	{
		sprite_index = spr_characterWalkingBoxR
	}
	else
	{
		sprite_index = spr_characterWalkingR
	}
}


// if player going up ramp


// if player going down ramp
