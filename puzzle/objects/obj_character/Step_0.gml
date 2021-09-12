// Movement based on keyboard press
characterHasBox = false;
boxBeingHeld = noone;
index = 0;

allBoxes = [obj_boxPLACEHOLDER];
numBoxes = 1;

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

// if character near box
if (distance_to_object(obj_boxPLACEHOLDER) == 0 
							&& keyboard_check_pressed(ord("E")))
{	
	characterHasBox = true;
}

// if character drops a box
if (characterHasBox && (keyboard_check_pressed(ord("X"))))
{
	boxBeingHeld.x = obj_character.x
	boxBeingHeld.y = obj_character.y
	characterHasBox = false;
}


// if player going up ramp


// if player going down ramp
