/// @description Insert description here
// You can write your code in this editor

var goal_id = layer_get_id("tile_goal");
var goal_lyr = tile_get_index(goal_id);
goal = layer_tilemap_get_id(goal_lyr);

var goal_enemy_id = layer_get_id("tile_enemy_goal");
var goal_enemy_lyr = tile_get_index(goal_enemy_id);
enemy_goal = layer_tilemap_get_id(goal_enemy_lyr);

speed = -5; // -2
direction = 180;
safeBounce = 2;
safe = 0;
wall1 = false;
wall2 = false;
gamePhase = 0;

start = 
{
	cx: x,
	cy: y
}

function increaseSpeed(numSpeed)
{
	if(speed < 0)
	{
		speed -= numSpeed;
	}
	else 
	{
		speed += numSpeed;
	}
}

function bounce(cx, cy, bot)
{
	if(gamePhase >= 1)
	{
		image_blend = make_color_rgb(irandom(255),irandom(255),irandom(255));
	}
	if (gamePhase >= 3)
	{
		part_particles_create(global.P_System, x, y, global.Particle1, 25);
	}
	if(safe > safeBounce)
	{
		audio_play_sound(snd_paddle_collision, 2, 0);
		if(bot)
		{
			// provide randomness to bounce angles
			direction_offset = 0;
			if keyboard_check(ord("W"))
			{
				direction_offset = random_range(5, 10);	
			}
			else if keyboard_check(ord("D"))
			{
				direction_offset = random_range(-10, -5);		
			}
			direction = point_direction(x, y, cx, cy);
		}
		else 
		{
			direction = point_direction(x, y, cx, cy);	
		}
		show_debug_message(direction);
		speed = -speed;
		safe = 0;
	}
}

function genericBounce()
{
	if(gamePhase >= 1)
	{
		image_blend = make_color_rgb(irandom(255),irandom(255),irandom(255));
	}
	if (gamePhase >= 3)
	{
		part_particles_create(global.P_System, x, y, global.Particle1, 25);
	}
	if(safe > safeBounce)
	{
		audio_play_sound(snd_paddle_collision, 2, 0);
		speed = -speed;
		safe = 0;
	}
	
}

function reset()
{
	speed = -2;
	direction = 180;
	x = start.cx;
	y = start.cy;
	if(gamePhase == 1)
	{
		speed = -5; // -3
	}
}

function changeSpeed(spd)
{
	if(speed < 0)
	{
		speed = -spd;
	}
	else 
	{
		speed = spd;
	}
}

function bounceWall() 
{

	show_debug_message(direction);
	direction_offset = 0;
	if (direction < 0)
	{
		direction_offset = random_range(1, 5);	
	}
	else
	{
		direction_offset = random_range(-5, -1);		
	}
	direction = -direction  + direction_offset;
	if(direction < 60)
	{
		direction += 1;
	}
	else if(direction > 300)
	{
		direction -= 1;
	}
}