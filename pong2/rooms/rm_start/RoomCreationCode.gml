textx = 318;
texty = 50;

instance_create_layer(textx, texty, "Instances", obj_pong_text);
obj_pong_text.image_xscale = 4;
obj_pong_text.image_yscale = 4;

instance_create_layer(textx + 1600, texty, "Instances", obj_2);
obj_2.image_xscale = 4;
obj_2.image_yscale = 4;
