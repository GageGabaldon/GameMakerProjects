
var lyr_truck = layer_get_id("Truck");
var obj_truck = instance_create_layer(-500, 600, lyr_truck, obj_truckOpen);
var lyr_player = layer_get_id("Character");
var obj_player = instance_create_layer(-500, 700, lyr_player, obj_character);

obj_truck.image_xscale += 3;
obj_truck.image_yscale += 3;

with(obj_truck){
TweenEasyMove(obj_truck.x, obj_truck.y, obj_truck.x + 1500, obj_truck.y, 20, 60, EaseOutCubic);
}

