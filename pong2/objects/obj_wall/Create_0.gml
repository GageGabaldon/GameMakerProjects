/// @description Insert description here
// You can write your code in this editor
gamePhase = 0;
pitch = 0;

function bounceWall()
{
	if(gamePhase >= 1)
	{
		image_blend = make_color_rgb(irandom(255),irandom(255),irandom(255));
	}
	
	if(gamePhase >= 2)
	{
		// set pitch and either increment or decrement based on how many bounces since
		// paddle collision
	}
	else 
	{
		audio_play_sound(pong_collision, 1, 0);
	}
	
	if(gamePhase >= 3)
	{
		// generate colorful sprite with direction either 90 or 270
	}
	
	y -= 5;
	TweenEasyMove(x, y, x, y + 5,  11, 10, EaseOutBounce);
}