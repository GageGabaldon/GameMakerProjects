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

m_action(fsm, ">frozen", function() {
	show_debug_message("frozen");
	if(lastState == "acid")
	{
		// freeze enemies
	}
	else if (lastState == "flame")
	{
		show_debug_message("PushBack");
		alarm[0] = 120;
		path_speed = global.spd;
	}
	else if(lastState == "electro")
	{
		// spread slow
	}
	
	lastState = "frozen";
});

m_action(fsm, ">acid", function() {
	show_debug_message("acidic");
	if(lastState == "frozen")
	{
		// freeze enemies	
	}
	else if (lastState == "flame")
	{
		//spread acid
	}
	else if(lastState == "electro")
	{
		// increase electro spread
	}	
	
	lastState = "acid";
});

m_action(fsm, ">flame", function() {
	show_debug_message("flaming");
	if(lastState == "acid")
	{
		// spread acid
	}
	else if (lastState == "electro")
	{
		// burst
	}
	else if(lastState == "frozen")
	{
		// pushback
		switch(global.rm)
		{
			case 1: path_reverse(Path1); break;
			case 2: path_reverse(Path2); break;
		}
		alarm[0] = 300;
		switch(global.rm)
		{
			case 1: path_reverse(Path1); break;
			case 2: path_reverse(Path2); break;
		}
	}
	
	lastState = "flame";
});

m_action(fsm, ">electro", function() {
	show_debug_message("electric");
	if(lastState == "acid")
	{
		// increase electro
	}
	else if (lastState == "flame")
	{
		// burst
	}
	else if(lastState == "frozen")
	{
		// spread slow
	}
	
	
	lastState = "electro";
});