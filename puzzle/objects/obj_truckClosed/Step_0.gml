/// @description Insert description here
// You can write your code in this editor

if (x >= 900)
{
	image_speed = 0;
	var lyr_button = layer_get_id("lyr_button");
    instance_create_layer(344, 320, lyr_button, obj_startButton);
	instance_create_layer(644, 320, lyr_button, obj_instructionsButton);
	
}