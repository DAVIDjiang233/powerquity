if(sprite_get_number(spr)==1){
	draw_sprite_ext(spr,0,1280*global.mirror,0,1,1,0,c_white,1-(global.playtime-stime)/(800*global.gamespeed));
}
else{
	draw_sprite(spr,floor((global.playtime-stime)*sfps/(1000*global.gamespeed)),0,0);
}