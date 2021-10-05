/// @description Insert description here
// You can write your code in this editor
checkMouse = tilemap_get_at_pixel(collision, mouse_x, mouse_y);

if(checkMouse > 0)
{
	distance = point_distance(self.x, self.y, mouse_x, mouse_y);
	if(distance < grappleLimit)
	{
			// tween from position to poistion and change sprite
			TweenEasyMove(x, y, mouse_x, mouse_y, 3, 10, EaseInBounce);
	}
	else 
	{
			// play miss animation
	}
}