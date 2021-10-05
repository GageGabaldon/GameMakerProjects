// Speeds of the character with movement
image_speed = 0; // how fast should frames be flipped through
walkSpeed = 4;


allBoxes = [obj_LBox1,
			obj_longBox1, obj_longBox2, obj_longBox3, 
			obj_squareBox1,
			obj_TBox1, obj_TBox2, 
			obj_ZBox1, obj_ZBox2];

allBoxesSize = array_length(allBoxes);
			
// if character has box
characterHasBox = false;
boxBeingHeld = noone;
characterBoxDistance = 1;
nearTruck = false;
