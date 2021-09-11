// Movement based on keyboard press

// if a player stops moving while facing left
if (keyboard_check_released(ord("A")))
{
	image_speed = walkSpeed/40; // smooth out movement
	sprite_index = spr_characterIdleL
}

// if a player stops moving while facing right
if (keyboard_check_released(ord("D")))
{
	image_speed = walkSpeed/40; // smooth out movement
	sprite_index = spr_characterIdleR
}

// if player tries to move left
if (keyboard_check(ord("A")))
{
	x -= walkSpeed; // decrease to go left
	image_speed = walkSpeed/25; // smooth out movement
	sprite_index = spr_characterWalkingL
}

// if player tries to move right
if (keyboard_check(ord("D")))
{
	x += walkSpeed; // increase to go right
	image_speed = walkSpeed/25; // smooth out movement
	sprite_index = spr_characterWalkingR
}
