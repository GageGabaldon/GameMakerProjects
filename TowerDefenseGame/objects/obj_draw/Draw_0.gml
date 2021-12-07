/// @description Insert description here
// You can write your code in this editor
draw_set_font(frog_font_big);
draw_text(startx, starty, "Instructions");

draw_set_font(frog_font_medium);
draw_text(startx, starty + offset1, "Defeat the evil flies by placing towers and feed the frog.");

draw_text(startx, starty + offset2, "Different Towers have unique properties.");

draw_text(towertextx, towertexty, "Cold");
draw_text(tower2_off, towertexty, "Flame");
draw_text(tower3_off, towertexty, "Acid");
draw_text(tower4_off, towertexty, "Electric");

draw_text(startx, offset3, "Combine the towers to create create devastating effects.");
draw_text(startx, offset4, "Upgrade the towers for better results.");
draw_text(startx, offset5, "Make a strategy; Upgrade Smartly; Prevail.");