/// @description Insert description here
// You can write your code in this editor

fsm = m_create("standing");
lastState = "standing";
my_direction = "right";
var background_lyr = layer_get_id("tile_background");
var collision_lyr = tile_get_index(background_lyr);
collision = layer_tilemap_get_id(collision_lyr);


jumpHeight = 30;
grappleLimit = 150;
walkSpeed = 25;
image_speed = 0;

m_rule(fsm, "jump", "standing", "falling");
m_rule(fsm, "grappleWall", "standing", "wall");
m_rule(fsm, "grappleMissStand", "standing", "grappleMiss");
m_rule(fsm, "grappleMissWall", "wall", "grappleMiss");
m_rule(fsm, "release", "wall", "falling");
m_rule(fsm, "stand", "wall", "standing");
m_rule(fsm, "stand", "falling", "standing");
m_rule(fsm, "wall", "falling", "wall");

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
