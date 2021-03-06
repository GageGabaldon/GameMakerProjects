
// ship point in direction of mouse;
image_angle = point_direction(x, y, mouse_x, mouse_y)-90;

// player ship movement
horizontal = keyboard_check( ord("D") ) - keyboard_check( ord("A") );
vertical = keyboard_check( ord("S") ) - keyboard_check( ord("W") );
h_speed = horizontal * move_speed;
v_speed = vertical * move_speed;

x += h_speed;
y += v_speed;

// send bullet where w
if(mouse_check_button_pressed(mb_left) && battleOn == true && dead == false)
{
	// trigger player bullet sound
	audio_play_sound(snd_player_pew, 1, false);
	// create bullet
	bullet = instance_create_layer(x, y, "phase4_objects", obj_player_bullet)
	// shoot bullet at mouse
	bullet.direction = point_direction(x, y, mouse_x, mouse_y);
	bullet.image_angle = point_direction(x, y, mouse_x, mouse_y) + 90;
	bullet.speed = 4;
}

// if player just died
if(dead == false && hp <= 0)
{
	dead = true;
	// stop battle
	battleOn = false;
	obj_boss.battleOn = false;
	// play player dies sequence
	visible = false;
	// wait for sequence to finish, then go to room lose
	if (alarm[0] < 0)
	{
		alarm[0] = 2 * room_speed;
	}
}
