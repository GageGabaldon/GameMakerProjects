/// @description Insert description here
// You can write your code in this editor

fsm = m_create("stand");
lastState = "stand";
my_direction = "right";
var background_lyr = layer_get_id("tile_background");
var collision_lyr = tile_get_index(background_lyr);
collision = layer_tilemap_get_id(collision_lyr);

jumpHeight = 150;
grappleLimit = 250;
walkSpeed = 25;
checkBot = 1;
checkSideRight = 0;
checkSideLeft = 0;
checkMouse = 0;
distance = 0;
spriteBotRadius = (sprite_height / 2);
spriteradius = (sprite_width/2) - 2;
image_speed = 0;
grappingWall = false;


m_rule(fsm, "standing", "fall", "stand");
m_rule(fsm, "standing", "wall", "stand");
m_rule(fsm, "falling", "stand", "fall");
m_rule(fsm, "falling", "wall", "fall");
m_rule(fsm, "sticking", "stand", "wall");
m_rule(fsm, "sticking", "falling", "wall");

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