/// @description Insert description here
// You can write your code in this editor
numHamsters += 1;
with(obj_hamster){
	obj_hamster.sprite_index = spr_hamster_happy;
}
layer_sequence_create("tile_background_assets", other.x, other.y, seq_hamster_flip);
instance_destroy(other);