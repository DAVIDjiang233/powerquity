draw_set_colour(#999999);
//draw_set_alpha(global.drawdepth[16]);
//draw_rectangle(x-(global.skinnumber[0]/2),y+6,x+(global.skinnumber[0]/2)-1,y,false);
draw_sprite_ext(global.playskin[71],floor((global.playtime-endtime)*global.skinnumber[23]/(1000*global.gamespeed)),x,y,1,1,0,c_white,global.drawdepth[16]);
//draw_text(x, y-10, string(keyamo));