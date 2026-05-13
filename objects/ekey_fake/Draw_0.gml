//image_blend=notecolor;
//draw_self();
draw_sprite_ext(sprite_index,floor((global.playtime-endtime)*global.skinnumber[23]/(1000*global.gamespeed)),x,y,1,1,0,notecolor,global.drawdepth[17]);

/*draw_set_halign(fa_center);
scr_set_font(Font1);
draw_set_colour(c_white);
draw_text(x, y-10, string(keyamo));*/