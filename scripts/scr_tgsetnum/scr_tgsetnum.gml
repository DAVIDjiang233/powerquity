function scr_tgsetnum(_tg,_num,_type){
	if(_type==1){
		for(var j=0;j<9;j++){
			if(j==2||j==6){
				for(var _i=0;_i<array_length(global.svchoose[j]);_i++;){
					global.svchange[j][_tg][global.svchoose[j][_i]][_type]=_num/4;
				}
			}
			else{
				for(var _i=0;_i<array_length(global.svchoose[j]);_i++;){
					global.svchange[j][_tg][global.svchoose[j][_i]][_type]=_num;
				}
			}
		}
	}
	else{
		for(var j=0;j<9;j++){
			for(var _i=0;_i<array_length(global.svchoose[j]);_i++;){
				global.svchange[j][_tg][global.svchoose[j][_i]][_type]=_num;
			}
		}
	}
}