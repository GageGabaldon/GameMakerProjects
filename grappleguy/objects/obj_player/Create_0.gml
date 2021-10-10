/// @description Insert description here
// You can write your code in this editor

fsm = m_create("stand");
lastState = "stand";
my_direction = "right";
var background_lyr = layer_get_id("tile_collision");
var collision_lyr = tile_get_index(background_lyr);
collision = layer_tilemap_get_id(collision_lyr);

// collecting hamsters and character varibles
numHamsters = 0;
image_alpha = 0;
wait = 0;
waitLimit = 150;
jumpHeight = 60;
grappleLimit = 250;
walkSpeed = 25;

// collision
checkBot = 1;
checkSideRight = 0;
checkSideLeft = 0;
checkSideUp = 0;

checkMouse = 0;
distance = 0;
spriteBotRadius = (sprite_height / 2) + 3;
spriteradius = (sprite_width/2) - 2;
image_speed = 0;
grappingWall = false;
grappleMovement = 0;
grappleMovementLimit = 40;

// grapple code
collide = 0;
notCollide_x = 0;
notCollide_y = 0;
linemarch = 0;

//grapple hook varialbes
mx = x;
my = y;
active = false;


m_rule(fsm, "standing", "fall", "stand");
m_rule(fsm, "standing", "wall", "stand");
m_rule(fsm, "standing", "grapple", "stand");
m_rule(fsm, "standing", "stick", "stand");

m_rule(fsm, "falling", "stand", "fall");
m_rule(fsm, "falling", "wall", "fall");
m_rule(fsm, "falling", "grapple", "fall");
m_rule(fsm, "falling", "stick", "fall");

m_rule(fsm, "sticking", "stand", "wall");
m_rule(fsm, "sticking", "fall", "wall");
m_rule(fsm, "sticking", "grapple", "fall");
m_rule(fsm, "sticking", "stick", "stand");

m_rule(fsm, "grappling", "stand", "grapple");
m_rule(fsm, "grappling", "fall", "grapple");
m_rule(fsm, "grappling", "wall", "grapple");
m_rule(fsm, "grappling", "stick", "grapple");


m_action(fsm, ">wall", function() {
	/**
		if(my_direction == "right")
	{
		sprite_index = spr_player_wall_right;
	}
	else {
		sprite_index = spr_player_wall_left;
	}
	*/

	lastState = "wall";
});

m_action(fsm, ">standing", function() {
	/**
	if(my_direction == "right")
	{
		sprite_index = spr_player_right;
	}
	else {
		sprite_index = spr_player_left;
	}
	*/
	lastState = "standing";
});

m_action(fsm, ">falling", function() {
		/**
		sprite_index = spr_player_air;
		*/
		lastState = "falling";
});

m_action(fsm, ">grapple", function() {
	/**
		if(my_direction == "right")
	{
		sprite_index = spr_player_wall_right;
	}
	else {
		sprite_index = spr_player_wall_left;
	}
	*/

	lastState = "grapple";
});
/**
m_action(fsm, ">grappleMiss", function() {
		//layer_sequence_create(background_lyr, x, y, seq_grapple_miss);
		if(lastState == "standing")
		{
			m_send(fsm, "grappleMissStand");
		}
		else if(lastState == "wall")
		{
			m_send(fsm, "grappleMissWall");
		}
		
});
*/