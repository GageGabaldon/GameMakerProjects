
// if the truck collision has been clicked on
hasBox = obj_character.characterHasBox;
nearTruck = obj_character.nearTruck;
// if the character has a box to place
if(hasBox && nearTruck)
{
	//distance = point_distance(mouse_x, mouse_y, self.x + (self.sprite_width/2), self.y + (self.sprite_height)/2);

	//if(distance < 550 || distance > 200)
	//{

	//with(obj_character)
	//{
		//var object = obj_character.boxBeingHeld;
		//var held = obj_character.characterHasBox;
	//}
		
		//if(numBoxes == 0)
	//	{
	//		boxHeld.x = mouse_x;
	//		boxHeld.y = mouse_y;
	//		boxHeld.image_alpha = 1;
	//		numBoxes += 1;
	//	}
	//}	
	//else 
	//{

		
	// get box being held

	var boxHeld = obj_character.boxBeingHeld;
	//var boxHeight = boxHeld.sprite_height;
	//var boxWidth = boxHeld.sprite_width;
	
	//pizel dimes
	//boxLeft = boxHeld.x-boxWidth;
	//boxRight = boxHeld.x+boxWidth;
	//boxTop = boxHeld.y+boxHeight;
	//boxBottom = boxHeld.y-boxHeight;
	//pixel dimensions of inner rectangle of truck 
	//truckLeft = self.x-13;
	//truckRight = self.x+156;
	//truckTop = self.y+14;
	//truckBottom = self.y-77;
	
	// rectangle_to_rectangle returns 2 if box is encompassed
	//VALID = 1;s
	
	// default placement is true until proven false
	var validPlacement = true;
	
	//check if valid placement, if box is within inner truck borders
	//if rectangle_in_rectangle(boxLeft, boxTop, boxRight, boxBottom, 
	//						  truckLeft, truckTop, truckRight, truckBottom) != VALID
	//{
	//	validPlacement = false;
	//}aw

	// check if valid placement by checking for intersection with all other boxesa

	//if place_empty(mouse_x, mouse_y, obj_boxParent)
	//{
	//	validPlacement = true;
	//}
	//else
	//{
	//	validPlacement = false;
	//}

	//validPlacement = true;
	// if the placement is valid
	if(validPlacement)
	{
		boxHeld.x = mouse_x;
		boxHeld.y = mouse_y;
		boxHeld.image_alpha = 1;
		numBoxes += 1;
		with(obj_character)
		{
			obj_character.characterHasBox = false;
			obj_character.boxBeingHeld = noone;
			obj_character.sprite_index = spr_characterIdleR;
		}
	}

}
