/// @description Insert description here
// You can write your code in this editor

var goal_id = layer_get_id("tile_goal");
var goal_lyr = tile_get_index(goal_id);
goal = layer_tilemap_get_id(goal_lyr);

var goal_enemy_id = layer_get_id("tile_enemy_goal");
var goal_enemy_lyr = tile_get_index(goal_enemy_id);
enemy_goal = layer_tilemap_get_id(goal_enemy_lyr);

speed = -2;
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

function bounce(cx, cy)
{
	if(gamePhase == 1)
	{
		image_blend = make_color_rgb(irandom(255),irandom(255),irandom(255));
	}
	if(safe > safeBounce)
	{
		audio_play_sound(snd_paddle_collision, 2, 0);
		direction = point_direction(x, y, cx, cy);	
		speed = -speed;
		safe = 0;
	}
}

function genericBounce()
{
	if(gamePhase == 1)
	{
		image_blend = make_color_rgb(irandom(255),irandom(255),irandom(255));
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
		speed = -3;
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
	direction = -direction;
	if(direction < 60)
	{
		direction += 1;
	}
	else if(direction > 300)
	{
		direction -= 1;
	}
}