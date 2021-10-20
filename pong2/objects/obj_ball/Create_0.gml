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
	direction = point_direction(x, y, cx, cy);	
	speed = -speed;
}

function genericBounce()
{
	speed = -speed;
}

function bounceWall() 
{
	direction = -direction;
}