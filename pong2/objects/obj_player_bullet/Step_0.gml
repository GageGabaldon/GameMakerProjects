// if bullet has hit boss
if (place_meeting(x, y, obj_boss))
{
	// destroy bullet on impact
	instance_destroy();
	// decrement boss health
	with (obj_boss)
	{
		// player bullets dont work if boss got injured (hes barriering)
		if (injured == false)
		{
			lost_health += 1;
			with (obj_boss_healthbar)
			{
				hp -=1;
			}
				with (obj_boss)
				{
					hp -= 1;
				}
		}
	}
}