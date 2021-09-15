
var lyr_truck = layer_get_id("Truck");
var obj_truck = instance_create_layer(-500, 600, lyr_truck, obj_truckOpen);
var lyr_player = layer_get_id("Character");
var obj_player = instance_create_layer(930, 680, lyr_player, obj_character);

obj_truck.image_xscale += 1;
obj_truck.image_yscale += 1;
obj_player.image_xscale += 3;
obj_player.image_yscale += 3;


with(obj_truck){
TweenEasyMove(obj_truck.x, obj_truck.y + 20, obj_truck.x + 1600, obj_truck.y + 20, 20, 100, EaseOutCubic);
}