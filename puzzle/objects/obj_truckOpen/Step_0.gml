/// @description Insert description here
// You can write your code in this editor

if(numBoxes == winCondition)
{
	room_goto(rm_end);
}

// check for click event 
if(mouse_check_button_pressed(mb_left))
{	
	// get character info
	with(obj_character)
	{
		var object = obj_character.boxBeingHeld;
		var held = obj_character.characterHasBox;
	}
	
	// if object is holding
	if(held)
	{
		// get sprite height and width and radius
		var _y = object.sprite_height;
		var _x = object.sprite_width;
	
		var sprite_x_radius = (_x / 2); 
		var sprite_y_radius = (_y /2);
		show_debug_message("x_radius" + string(sprite_x_radius));
		show_debug_message("y_radius" + string(sprite_y_radius));
		

		var inClickable = (mouse_x < 1241 && mouse_x > 954) && (mouse_y > 558 && mouse_y < 685);
		var inBox = (mouse_x + sprite_x_radius < 1241 && mouse_x - sprite_x_radius > 954) && (mouse_y - sprite_y_radius > 558 && mouse_y + sprite_y_radius < 685);
		show_debug_message("inside clickable" + string(inClickable));
		show_debug_message("inside box" + string(inBox));
		
		// if user click is inside the truck and object is also place box
		if(inClickable && inBox)
		{ 
			if(numBoxes == 0)
			{
				object.x = mouse_x;
				object.y = mouse_y;
				object.image_alpha = 1;
				numBoxes += 1;
				array_push(currentBoxes, object);
				
				// set character information
				with(obj_character)
				{
					obj_character.characterHasBox = false;
					obj_character.boxBeingHeld = noone;
					obj_character.sprite_index = spr_characterIdleR;
				}
			}	
			else 
			{
				var yo = place_free(mouse_x, mouse_y);
				show_debug_message(yo);
				if(!place_free(mouse_x, mouse_y))
				{
					object.x = mouse_x;
					object.y = mouse_y;
					object.image_alpha = 1;
					array_push(currentBoxes, object);
					numBoxes += 1;
						
					with(obj_character) {
						obj_character.characterHasBox = false;
						obj_character.boxBeingHeld = noone;
						obj_character.sprite_index = spr_characterIdleR;
					}
				}
				
				
			}
		}
	}
	else 
	{
		if(position_meeting(mouse_x, mouse_y, obj_boxParent))
		{
			for(var index = 0; index < array_length(currentBoxes); index += 1)
			{
				if(instance_exists(currentBoxes[index]))
				{
					var distance = point_direction(mouse_x, mouse_y, currentBoxes[index].x, currentBoxes[index].y);
				
					if(distance < 10)
					{
						with(obj_character)
						{
							obj_character.characterHasBox = true;
							obj_character.boxBeingHeld = currentBoxes[index];
							obj_character.sprite_index = spr_characterIdleBoxR;
						
						}
					}
				}
			}
		}
	}
}