if(!instance_exists(obj_player))
{
	if(endCounter > endWait)
	{
		room_goto(rm_win);
	}
	else 
	{
		endCounter += 1;
	}
}