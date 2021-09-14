/// @description Insert description here
// You can write your code in this editor

if(numBoxes == winCondition)
{
	room_goto(rm_end);
}
else 
{
	if(mouse_check_button_pressed(mb_left)){
		distance = point_distance(mouse_x, mouse_y, self.x + (self.sprite_width/2), self.y + (self.sprite_height)/2);

		if(distance < 550 || distance > 200){

			with(obj_character){
				var object = obj_character.boxBeingHeld;
				var held = obj_character.characterHasBox;
			}

		if(held)
		{
			var _y = object.sprite_height;
			var _x = object.sprite_width;
		if(numBoxes == 0)
	{
		object.x = mouse_x;
		object.y = mouse_y;
		object.image_alpha = 1;
		numBoxes += 1;
		with(obj_character){
			obj_character.characterHasBox = false;
			obj_character.boxBeingHeld = noone;
			obj_character.sprite_index = spr_characterIdleR;
		}
	}	
	else {

	}

} 
}
}
}