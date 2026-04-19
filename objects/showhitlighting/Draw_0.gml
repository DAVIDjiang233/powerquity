if(sprite_get_number(spr)==1){
	draw_sprite_ext(spr,0,x,y,1,1,0,c_white,1-(global.playtime-stime)/(300*global.gamespeed));
}
else{
	draw_sprite(spr,floor((global.playtime-stime)*sfps/(1000*global.gamespeed)),x,y);
}