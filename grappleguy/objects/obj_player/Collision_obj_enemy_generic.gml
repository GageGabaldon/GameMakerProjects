/// @description Insert description here
// You can write your code in this editor


if(my_direction == "right")
{
	sprite_index = spr_hurt_right;
}
else {
	sprite_index = spr_hurt_left;
}

room_goto(rm_lose);