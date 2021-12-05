/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
switch(global.rm)
{
	case 1: path_start(Path1,global.spd,0,1); break;
	case 2: path_start(Path2,global.spd,0,1); break;
}

//path_start(Path1,global.spd,0,1);
hp = global.hp;
fsm = m_create("normal");
lastState = "normal";
effectTimerMax = 60;
slowNum = 2;
damageMulti = 2;
stateTimer = 0;
stateMax = 30;
damageOverTime = false;
electroMaxSpread = 5;
electroRange = 30;
dmg = 10;
effectDuration = 1;

m_rule(fsm, "normal", "flame", "normal");
m_rule(fsm, "normal", "frozen", "normal");
m_rule(fsm, "normal", "acid", "normal");
m_rule(fsm, "normal", "electro", "normal");

m_rule(fsm, "flaming", "normal", "flame");
m_rule(fsm, "flaming", "frozen", "flame");
m_rule(fsm, "flaming", "acid", "flame");
m_rule(fsm, "flaming", "electro", "flame");

m_rule(fsm, "freezing", "normal", "frozen");
m_rule(fsm, "freezing", "flame", "frozen");
m_rule(fsm, "freezing", "acid", "frozen");
m_rule(fsm, "freezing", "electro", "frozen");

m_rule(fsm, "electric", "normal", "electro");
m_rule(fsm, "electric", "frozen", "electro");
m_rule(fsm, "electric", "acid", "electro");
m_rule(fsm, "electric", "flame", "electro");

m_rule(fsm, "acidic", "normal", "acid");
m_rule(fsm, "acidic", "frozen", "acid");
m_rule(fsm, "acidic", "flame", "acid");
m_rule(fsm, "acidic", "electro", "acid");

m_action(fsm, "<*" , function()
{
	path_speed = global.spd;
	image_blend = c_white;
	damageOverTime = false;
});

m_action(fsm, ">normal", function() {
	show_debug_message("normal");
	lastState = "normal";
});

m_action(fsm, ">frozen", function() {
	show_debug_message("freezing");
	if(lastState == "acid")
	{
		show_debug_message("frozen");
		// freeze enemies
		path_speed = 0;
	}
	else if (lastState == "flame")
	{
		// pushback
		show_debug_message("PushBack");
		path_speed = -global.spd;
		alarm[0] = room_speed;
	}
	else if(lastState == "electro")
	{
		show_debug_message("Slow Spread");
		// spread slow
		spreadElectro(self.x, self.y, electroMaxSpread, dmg, true);
	}
	
	path_speed = global.spd / slowNum;
	image_blend = c_blue;
	lastState = "frozen";
	alarm[1] = room_speed * effectDuration;
});

m_action(fsm, ">acid", function() {
	show_debug_message("acidic");
	if(lastState == "frozen")
	{
		// freeze enemies	
		show_debug_message("frozen");
		path_speed = 0;
	}
	else if (lastState == "flame")
	{
		//spread acid
		show_debug_message("SpreadAcid");
	}
	else if(lastState == "electro")
	{
		// increase electro
		show_debug_message("ElectroSpread");
		spreadElectro(self.x, self.y, electroMaxSpread * 2, dmg, false);
	}	
	
	image_blend = c_green;
	lastState = "acid";
	alarm[1] = room_speed * effectDuration;
});

m_action(fsm, ">flame", function() {
	show_debug_message("flaming");
	if(lastState == "acid")
	{
		// spread acid
		show_debug_message("SpreadAcid");
	}
	else if (lastState == "electro")
	{
		// burst
		show_debug_message("Burst");
	}
	else if(lastState == "frozen")
	{
		// pushback
		show_debug_message("PushBack");
		path_speed = -global.spd;
		alarm[0] = room_speed;
	}
	
	damageOverTime = true;
	image_blend = c_red;
	lastState = "flame";
	alarm[1] = room_speed * effectDuration;
});

m_action(fsm, ">electro", function() {
	show_debug_message("electric");
	if(lastState == "acid")
	{
		show_debug_message("ElectroSpread");
		// increase electro
		spreadElectro(self.x, self.y, electroMaxSpread * 2, dmg, false);
	}
	else if (lastState == "flame")
	{
		// burst
		show_debug_message("Burst");
	}
	else if(lastState == "frozen")
	{
		show_debug_message("Slow Spread");
		// spread slow
		spreadElectro(self.x, self.y, electroMaxSpread, dmg, true);
	}
	
	spreadElectro(self.x, self.y, electroMaxSpread, dmg, false);
	lastState = "electro";
});

function changePathSpeed(num)
{
	path_speed = global.spd * num;
}

function changeHealth(num)
{
	hp += num;
}

// does not spread to unique targets yet
function spreadElectro(numX, numY, spread, dmg, slow)
{
	var index = 0;
	var last = self;
	var electrocuted = [];
	var enemy = instance_nearest(numX,numY,obj_enemy);
	self.hp -= dmg;
	self.image_blend = c_purple;
	if(slow)
	{
		self.path_speed = path_speed / 2;
	}
	self.alarm[1] = room_speed * effectDuration;
	
	while(index < spread)
	{
		if (enemy != noone)
		{
			if (point_distance(last.x,last.y,enemy.x,enemy.y) <= electroRange)
			{
				enemy.hp -= dmg;
				if(slow)
				{
					enemy.path_speed = path_speed / 2;
				}
			}
		}
		last = enemy;
		enemy = instance_nearest(enemy.x, enemy.y, obj_enemy);
		index++;
	}
}

changeHealth(200);
changePathSpeed(.5);