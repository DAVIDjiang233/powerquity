function scr_tgset(_tg){
	for(var j=0;j<9;j++){
		if(array_length(global.svchange[j])<=_tg){
			for(var _i=array_length(global.svchange[j]);_i<=_tg;_i++;){
				global.svchange[j][_i]=[];
			}
		}
	}
}