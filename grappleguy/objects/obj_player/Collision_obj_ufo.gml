/// @description Insert description here
// You can write your code in this editor

if(numHamsters > 4)
{
	yo = layer_sequence_create("tile_background_assets", other.x, other.y, seq_endgame);
	camera_set_view_target(view_camera[0], yo);
	instance_destroy(other);
	instance_destroy(self);
}