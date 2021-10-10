if(!instance_exists(obj_player))
{
	if(endCounter > endWait)
	{
		room_goto(rm_win);
	}
	else 
	{
		//view_set_yport(view_camera[0], x);
		endCounter += 1;
	}
}