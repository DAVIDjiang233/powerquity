draw_set_alpha(1*global.drawdepth[5]);
draw_sprite(global.playskin[36],floor((global.playtime)*global.skinnumber[23]/(1000*global.gamespeed)),x,y);
if (global.playtype==1) exit;
if (ctrl_playgame.lkgon==0) draw_sprite(global.playskin[166],0,0,0);
else draw_sprite(global.playskin[167],0,0,0);