/// @description Insert description here
// You can write your code in this editor

// win condition
if(numBoxes == winCondition)
{
	self.win();
}

// check for click event 
if(mouse_check_button_pressed(mb_left) && obj_character.characterHasBox &&
  numBoxes != winCondition)
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
		var _y;
		var _x;
		
		// get sprite height and width and radius
		if(object.rotated)
		{
			 _y = object.sprite_height;
			 _x = object.sprite_width;
		}
		else
		{
			 _x = object.sprite_height;
			 _y = object.sprite_width;
		}
		
		// flip for some reason idk
		var temp = _x;
		_x = _y;
		_y = temp;
		
		// flip again for long box idk
		if(object.id == obj_longBox1.id || object.id == obj_longBox2.id || object.id == obj_longBox3.id)
		{
			var temp = _x;
			_x = _y;
			_y = temp;
		}
		
		
		// get the sprite radius to compare to see if box within the clickable area
		var sprite_x_radius = (_x / 2) - 10; 
		var sprite_y_radius = (_y /2) - 10;
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
				object.inTruck = true;
				
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
				// check if the objects are colliding with each other
				var notCollide = true;
				
				
				// iterate through all possible objects
				for(var index = 0; index < array_length(allBoxes); index += 1)
				{
					// check if the box being checked isnt the box being held
					if(allBoxes[index].id != object.id)
					{
						// check if collision
						if(object.boxCollide(mouse_x, mouse_y, allBoxes[index]))
						{
							notCollide = false;
						}
					}
				}
				
				// no collision
				if(notCollide)
				{
					object.x = mouse_x;
					object.y = mouse_y;
					object.image_alpha = 1;
					numBoxes += 1;
					object.inTruck = true;
					
					with(obj_character) {
						obj_character.characterHasBox = false;
						obj_character.boxBeingHeld = noone;
						obj_character.sprite_index = spr_characterIdleR;
					}
				}	
			}
		}
	}
}