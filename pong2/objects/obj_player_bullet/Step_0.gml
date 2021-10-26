// if bullet has hit boss
if (place_meeting(x, y, obj_boss))
{
	// destroy bullet on impact
	instance_destroy();
	// decrement boss health
	with (obj_boss)
	{
		hp -=1;	
	}
}