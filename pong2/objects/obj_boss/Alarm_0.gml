// shoot bullet when timer runs out
bullet = instance_create_layer(x, y, "phase4_objects", obj_enemy_bullet);
// shoot bullet at players x and y
bullet.direction = point_direction(x, y, player_x, player_y);
bullet.speed = 4;	