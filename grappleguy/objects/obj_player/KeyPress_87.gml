/// @description Insert description here
// You can write your code in this editor

if(!m_is_state(fsm, "falling"))
{
	if(!grappingWall)
	{
		y -= 150;
		m_send(fsm, "jump");
	}
	else
	{
		y -=2;
	}
}