/// @description Insert description here
// You can write your code in this editor
global.Particle1 = part_type_create();

part_type_shape(global.Particle1, pt_shape_star);

part_type_size(global.Particle1, 0.01, 0.05, 0, 0.5);

part_type_color3(global.Particle1, c_fuchsia, c_orange, c_olive);

part_type_alpha3(global.Particle1, 0.5, 1, 0);

part_type_speed(global.Particle1, 2, 5, -0.10, 0);

part_type_direction(global.Particle1, 0, 359, 0, 20);

part_type_blend(global.Particle1, true);

part_type_life(global.Particle1, 30, 60);