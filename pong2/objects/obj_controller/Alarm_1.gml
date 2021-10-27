// wait until sequence has finished
// destroy sequences and replace with their espective objects

// destroy the objects
instance_destroy(obj_enemy_line);
instance_destroy(obj_player_line);
// play sequence of them combining
seq_teamup = layer_sequence_create(layer_get_id("phase4_sequences"), player_x, player_y, seq_phase4_teamup);


// wait for sequences to finish, then create objects
if (alarm[2] < 0)
{
	alarm[2] = 7 * room_speed;
}