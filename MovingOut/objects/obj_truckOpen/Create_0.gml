/// @description Insert description here
// You can write your code in this editor

//get allBoxes from obj_character
allBoxes = [obj_LBox1,
			obj_longBox1, obj_longBox2, obj_longBox3, 
			obj_squareBox1,
			obj_TBox1, obj_TBox2, 
			obj_ZBox1, obj_ZBox2];

allBoxesSize = array_length(allBoxes);
//num boxes in truck
numBoxes = 0;
//num boxes needed in truck to win
winCondition = 9;

function win()
{
	for(var index = 0; index < array_length(allBoxes); index += 1)
	{
		instance_destroy(allBoxes[index]);
	}
	self.sprite_index = spr_truckClosed;
	
	TweenEasyMove(self.x, self.y, self.x + 400, self.y, 10, 40, EaseOutElastic);
	room_goto(rm_end);
}