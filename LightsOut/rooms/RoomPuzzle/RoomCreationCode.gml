// creation code for room puzzle

var lyr_instances = layer_get_id("Instances");
var lights = array_create(9);

for(var i=0;  i<3; i+=1){
	for(var j=0;  j<3; j+=1){
		var inst_light = instance_create_layer(2+j*10, 2+i*10, lyr_instances, obj_light);
		lights[i*3+j] = inst_light;
	}
}

for(var i=0;  i<3; i+=1){
	for(var j=0;  j<3; j+=1){
		var inst_light = lights[i*3+j];
		inst_light.left = noone;
		if(i > 0) inst_light.left = lights[(i-1)*3+j];
		inst_light.right = noone;
		if(i<2) inst_light.right = lights[(i+1) * 3+j];
		inst_light.up = noone;
		if(j>0) inst_light.up = lights[i*3 + (j-1)];
		inst_light.down = noone;
		if(j < 2) inst_light.down = lights[i*3+(j+1)];
	}
}

randomize();
for( var i=0; i<3; i+=1){
	toggle(lights[irandom(9)]);
}