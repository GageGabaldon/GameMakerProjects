/// @description Insert description here
// You can write your code in this editor

var background_lyr = layer_get_id("tile_collision");
var collision_lyr = tile_get_index(background_lyr);
collision = layer_tilemap_get_id(collision_lyr);

spriteradius = sprite_height / 2;
movementSpeed = 5; // 2
canMove = true;
goal_point = 0;
is_collision = false;

topBuffered = self.y - (sprite_height / 2);
botBuffered = self.y + (sprite_height / 2);
rightBuffered = self.x + ((sprite_width / 2) / 4);
leftBuffered = self.x - ((sprite_width / 2) / 4);

temp1 = 0;
temp2 = 0;
buffer = 1;
pointArraySize = 6;

leftTopCorner = 
{
	cx : temp1,
	cy : temp2,
	xfunc: "-",
	yfunc: "-"
};

rightTopCorner = 
{
	cx : temp1,
	cy : temp2,
	xfunc: "+",
	yfunc: "-"
};

leftBotCorner = 
{
	cx : temp1,
	cy : temp2,
	xfunc: "-",
	yfunc: "+"
};

rightBotCorner = 
{
	cx : temp1,
	cy : temp2,
	xfunc: "+",
	yfunc: "+"
};
top =
{
	cx : temp1,
	cy : temp2,
	xfunc: "o",
	yfunc: "-"
};
bot =
{
	cx : temp1,
	cy : temp2,
	xfunc: "o",
	yfunc: "+"
};

points = [leftTopCorner, 
		  rightTopCorner, 
		  top,
		  leftBotCorner, 
		  rightBotCorner,
		  bot]

function calculatePoint(xycord, special)
{
	topBuffered = self.y - (sprite_height / 2);
	botBuffered = self.y + (sprite_height / 2);
	rightBuffered = self.x + ((sprite_width / 2) / 4);
	leftBuffered = self.x - ((sprite_width / 2) / 4);
	if(xycord == "X")
	{
		if(special == "+")
		{
			return rightBuffered;
		}
		else if (special == "-")
		{
			return leftBuffered;
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
			return botBuffered;
		}
		else if (special == "-")
		{
			return topBuffered;
		}
		else 
		{
			return y;
		}
	}
}

function updatePoints()
{
	for(var i = 0; i < pointArraySize; i++)
	{
		points[i].cx = calculatePoint("X", points[i].xfunc);
		points[i].cy = calculatePoint("Y", points[i].yfunc);
	}
}

// checks the corners 
function checkCorners() 
{
	for(var i = 0; i < pointArraySize; i++)
	{
		if(collision_point(points[i].cx, points[i].cy, obj_ball, true, true))
		{
			obj_ball.increaseSpeed(1);
			if(i > 2)
			{
				obj_ball.bounce(points[i].cx, points[i].cy, true);
			}
			else 
			{
				obj_ball.bounce(points[i].cx, points[i].cy, false);
			}
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
		var inst = collision_rectangle(self.x - ((sprite_width / 2) / 4), 
		self.y - (sprite_height / 2), 
		self.x + ((sprite_width / 2) / 4), 
		self.y + (sprite_height / 2), 
		obj_ball, true, true);
			
		if(inst != noone)
		{
			obj_ball.genericBounce();
			return true;
		}
		return false;
	}
}
