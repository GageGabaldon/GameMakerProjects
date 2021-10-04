/// @description Insert description here
// You can write your code in this editor
camera_set_view_pos(MyCamera, self.x, self.y);
if(tilemap_get_at_pixel(collision, x, y - (64 + 1)) < 0)
{
	y += 3;
	if(!m_is_state(fsm, "falling"))
	{
		m_send(fsm, "falling");
	}
}
else {
	if(!m_is_state(fsm, "standing"))
	{
		m_send(fsm, "stand");
	}
}


if(keyboard_check(ord("A")))
{
	x += walkSpeed; // decrease to go left
	image_speed = walkSpeed/25; // smooth out movement
}
if(keyboard_check(ord("D")))
{
	x -= walkSpeed; // decrease to go left
	image_speed = walkSpeed/25; // smooth out movement
}

if(keyboard_check_pressed(ord("W")))
{
	TweenEasyMove(x, y, x, y+ jumpHeight, 1, 3, EaseInCubic);
	m_send(fsm, "falling");
}