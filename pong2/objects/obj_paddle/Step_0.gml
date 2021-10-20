/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
checkBot = tilemap_get_at_pixel(collision, x, y + spriteradius);
checkTop = tilemap_get_at_pixel(collision, x, y - spriteradius);

updatePoints();
checkCollisions();