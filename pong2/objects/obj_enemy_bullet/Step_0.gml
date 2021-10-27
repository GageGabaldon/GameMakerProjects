// if bullet has hit player
if (place_meeting(x, y, obj_player_ship))
{
	// destroy bullet on impact
	instance_destroy();
	// decrement player health
	with (obj_player_healthbar)
	{
		hp -= 10;	
	}
	with (obj_player_ship)
	{
		hp -= 10;
	}
}	
