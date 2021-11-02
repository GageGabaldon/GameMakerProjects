/// @description Insert description here
// You can write your code in this editor

if(wait < waitMax)
{
	wait += 1;
}
else 
{
	TweenEasyFade(0, 1, 30, 30, EaseInCubic);
	wait = 0;
}