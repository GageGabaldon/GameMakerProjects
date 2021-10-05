var lyr_truck = layer_get_id("lyr_truck");
var obj_truck = instance_create_layer(-500, 600, lyr_truck, obj_truckClosed);

obj_truck.image_xscale += 0.5;
obj_truck.image_yscale += 0.5;

with(obj_truck){
TweenEasyMove(obj_truck.x, obj_truck.y + 20, obj_truck.x + 1400, obj_truck.y + 20, 20, 400, EaseOutCubic);
}
