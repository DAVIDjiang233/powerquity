draw_set_alpha(global.drawdepth[17]);
draw_sprite(sprite_index,floor((global.playtime-endtime)*global.skinnumber[23]/(1000*global.gamespeed)),x,y);

if debug_mode{
draw_set_halign(fa_center);
scr_set_font(Font1);
draw_set_colour(c_white);
draw_text(x, y+20, string(keyamo));
draw_text(x+100, y+20, string(keyamo2));
}