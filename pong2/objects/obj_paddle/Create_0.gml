/// @description Insert description here
// You can write your code in this editor

var background_lyr = layer_get_id("tile_collision");
var collision_lyr = tile_get_index(background_lyr);
collision = layer_tilemap_get_id(collision_lyr);

spriteradius = sprite_height / 2;
movementSpeed = 2;
goal_point = 0;
is_collision = false;
temp1 = self.x - (sprite_width / 2);
temp2 = self.y - (sprite_height / 2);

leftTopCorner = 
{
	cx : temp1,
	cy : temp2,
	xfunc: "-",
	yfunc: "-"
};

temp1 = self.x + (sprite_width / 2);
temp2 = self.y - (sprite_height / 2);

rightTopCorner = 
{
	cx : temp1,
	cy : temp2,
	xfunc: "+",
	yfunc: "-"
};

temp1 = self.x - (sprite_width / 2);
temp2 = self.y + (sprite_height / 2);


leftBotCorner = 
{
	cx : temp1,
	cy : temp2,
	xfunc: "-",
	yfunc: "+"
};

temp1 = self.x + (sprite_width / 2);
temp2 = self.y + (sprite_height / 2);

rightBotCorner = 
{
	cx : temp1,
	cy : temp2,
	xfunc: "+",
	yfunc: "+"
};

points = [leftTopCorner, 
		  leftBotCorner, 
		  rightTopCorner, 
		  rightBotCorner]

function calculatePoint(xycord, special)
{
	if(xycord == "X")
	{
		if(special == "+")
		{
			return x + (sprite_width / 2);
		}
		else if (special == "-")
		{
			return x - (sprite_width / 2);
		}
		else 
		{
			return x;
		}
	
	}
	else 
	{
		if(special == "+")
		{
			return y + (sprite_height / 2);
		}
		else if (special == "-")
		{
			return y - (sprite_height / 2);
		}
		else 
		{
			return y;
		}
	}
}

function updatePoints()
{
	for(var i = 0; i < 4; i++)
	{
		points[i].cx = calculatePoint("X", points[i].xfunc);
		points[i].cy = calculatePoint("Y", points[i].yfunc);
	}
}

// checks the corners 
function checkCorners() 
{
	for(var i = 0; i < 4; i++)
	{
		if(collision_point(points[i].cx, points[i].cy, obj_ball, true, true))
		{
			obj_ball.increaseSpeed(1);
			obj_ball.bounce(points[i].cx, points[i].cy);
			return true;
		}
	}
	
	return false;
}

// debug
function showDebug(){
	show_debug_message(points[0].cx);
}

// checks collisions 
function checkCollisions()
{
	if(checkCorners())
	{
		return true;
	}
	else 
	{
		var inst = collision_rectangle(x - (sprite_width / 2), 
		y - (sprite_height / 2), 
		x + (sprite_width / 2), 
		y + (sprite_height / 2), obj_ball, true, true);
			
		if(inst != noone)
		{
			obj_ball.genericBounce();
			return true;
		}
		return false;
	}
}

