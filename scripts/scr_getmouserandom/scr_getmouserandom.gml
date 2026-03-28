function scr_getmouserandom(_type){
	
	
	var _q=global.list,_canread=0;
	if(_type==1&&array_length(global.choose)>=1) _q=global.choose[0]-1;
	else _type=0;
	
	while(_q>=0){
		if(_canread==1) _canread=0;
		if real(global.chartread[_q][1])<global.playtime-20000 break;
		if(timinggroup<0||global.chartread[_q][3]==timinggroup){
			if(global.chartread[_q][0]=="RT"){_canread=1;}
			else if(global.chartread[_q][0]=="RM"){_canread=1;}
			else if(global.chartread[_q][0]=="RA"){_canread=1;}
			else if(global.chartread[_q][0]=="RF"){_canread=1;}
			
			
			if(_canread==1){
				if(608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25<mouse_y+30
				&&608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25>mouse_y-10
				&&round((mouse_x-359)/102-real(global.chartread[_q][2]))==0){
					return _q;
				}
				else _canread=0;
			}
		}
		_q--;
	
	}
	if(_type==1) return(scr_getmouserandom(0));
	return -1;
}