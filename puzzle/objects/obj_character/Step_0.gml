
// if character picks up box
if (distance_to_object(obj_boxPLACEHOLDER) < 20
							&& keyboard_check_pressed(ord("E")))
{	
	// if character is already holding a box
	if (characterHasBox)
	{
		// drop boxBehindHeld
		// boxBeingHeld
	}
	characterHasBox = true;
	boxBeingHeld = obj_boxPLACEHOLDER;
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
}

// if character drops a box
if (characterHasBox && keyboard_check_pressed(ord("X")))
{	
	characterHasBox = false;
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
