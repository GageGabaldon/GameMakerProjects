// Creation code for rm_puzzle

// While some functions can accept the string name of the layer, it's 
// more efficient to get a reference to the layer once per room.
var lyr_instances = layer_get_id("Instances");

// Someone made a great suggestion in class to parameterize the creation
// logic better so the numbers don't seem "magical".

// The number of pixels padding each light
var padding = 2;

// The number of lights in each dimension
var grid_dimension = 3;

// Instead of hard coding 8 pixels as the width of the sprite, we can 
// pull the width from the sprite image data
var light_width = sprite_get_width(spr_light_on);

// Iterating along the y and x axis, we then create a grid of lights
var lights = array_create(grid_dimension*grid_dimension);
for (var i=0; i<grid_dimension; i+=1) {
	for (var j=0; j<grid_dimension; j+=1) {
		var _x = padding+j*(padding+light_width);
		var _y = padding+i*(padding+light_width);
		var inst_light = instance_create_layer(
			_x-64, 
			_y,
			lyr_instances, obj_light);
		with (inst_light) {
			TweenEasyMove(_x-64, _y, _x, _y, 2*(i*grid_dimension+j), 45, EaseOutCubic);
		}
		lights[i*grid_dimension+j] = inst_light;
	}
}

// After the lights array is populated, we set up the adjacency information
// for each light
for (var i=0; i<grid_dimension; i+=1) {
	for (var j=0; j<grid_dimension; j+=1) {
		var inst_light = lights[i*grid_dimension+j];
		
		// Is there a light to the left?
		inst_light.left = noone;
		if (i > 0) inst_light.left = lights[(i-1)*3+j];
		
		// Is there a light to the right?
		inst_light.right = noone;
		if (i < (grid_dimension-1)) inst_light.right = lights[(i+1)*grid_dimension+j];
		
		// Is there a light above (up)?
		inst_light.up = noone;
		if (j > 0) inst_light.up = lights[i*3+(j-1)];
		
		// Is there a light below (down)?
		inst_light.down = noone;
		if (j < (grid_dimension-1)) inst_light.down = lights[i*grid_dimension+(j+1)];
		
	}
}

// We call randomize to set the random seed.  You only need to do this once!
// You could call this just on the title screen for example but I'll keep it
// here for clarity even though it will be called every time this room is (re-)created.
randomize();

// We randomly click some lights to build a game.  The while loop makes sure
// we don't create a "blank" game.  A more complicated implementation would 
// measure the game "difficulty" and click lights to match a certain difficulty
// (e.g., the minimum number of clicks to solve).  This game isn't that fancy.
while (is_clear()) {
	for (var i=0; i<3; i+=1) {
		toggle(lights[irandom(grid_dimension*grid_dimension-1)]);
	}
}
