// wait for sequences
//destroy sequences
layer_sequence_destroy(seq_teamup);
layer_sequence_destroy(seq_bosscreation);

//destory pongwalls
instance_destroy(obj_wall);

//create objects
instance_create_layer(player_x, player_y, "phase4_objects", obj_player_ship);
instance_create_layer(boss_x, boss_y, "phase4_objects", obj_boss);

camera_set_view_speed(view_camera[0], -1, 30) ;
// health bars
instance_create_layer(0, 0, "phase4_objects", obj_boss_healthbar);
instance_create_layer(0, 0, "phase4_objects", obj_player_healthbar);