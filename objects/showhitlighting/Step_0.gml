if(sprite_get_number(spr)==1){
	if(global.playtime>stime+300){
		instance_destroy();
	}
}
else if(floor((global.playtime-stime)*sfps/1000)>=sprite_get_number(spr)){
	instance_destroy();
}