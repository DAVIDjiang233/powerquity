if(sprite_get_number(spr)==1){
	if(global.playtime>stime+(300*global.gamespeed)){
		instance_destroy();
	}
}
else if(floor((global.playtime-stime)*sfps/(1000*global.gamespeed))>=sprite_get_number(spr)){
	instance_destroy();
}