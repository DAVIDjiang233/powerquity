function scr_getmousenote(_type){
	
	
	var _q=global.list,_canread=0;
	if(_type==1&&array_length(global.choose)>=1) _q=global.choose[0]-1;
	else _type=0;
	
	while(_q>=0){
		if(_canread==1) _canread=0;
		if real(global.chartread[_q][1])<global.playtime-20000 break;
		if(timinggroup<0||global.chartread[_q][3]==timinggroup){
			if(global.chartread[_q][0]=="T"){_canread=1;}
			else if(global.chartread[_q][0]=="F"){_canread=1;}
			else if(global.chartread[_q][0]=="B"){_canread=1;}
			else if(global.chartread[_q][0]=="N"){_canread=1;}
			else if(global.chartread[_q][0]=="M"){_canread=1;}
			else if(global.chartread[_q][0]=="A"){_canread=1;}
			else if(global.chartread[_q][0]=="L"){_canread=1;}
			else if(global.chartread[_q][0]=="LN"){_canread=1;}
			else if(global.chartread[_q][0]=="P"){_canread=1;}
			else if(global.chartread[_q][0]=="RT"||global.chartread[_q][0]=="RM"||global.chartread[_q][0]=="RA"){
				var _track=global.chartread[_q][4+floor(global.rand[real(global.chartread[_q][2])]*(array_length(global.chartread[_q])-4))];
				if (_track=="none"){
					_track=0;
				}
				if(_canread==0){
					if(608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25<mouse_y+30
					&&608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25>mouse_y-10
					&&round((mouse_x-257)/102-real(_track))==0){
						return _q;
					}
				}
			}
			else if(global.chartread[_q][0]=="RF"){
				var _track=global.chartread[_q][5+floor(global.rand[real(global.chartread[_q][2])]*(array_length(global.chartread[_q])-5))];
				if (_track=="none"){
					_track=0;
				}
				if(_canread==0){
					if(608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25<mouse_y+30
					&&608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25>mouse_y-10
					&&round((mouse_x-257)/102-real(_track))==0){
						return _q;
					}
				}
			}
			else if(global.chartread[_q][0]=="BP"){
				if(_canread==0){
					if(608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25<mouse_y+30
					&&608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25>mouse_y-10
					&&round((mouse_x-257)/102-real(global.chartread[_q][2]))>=0
					&&round((mouse_x-257)/102-real(global.chartread[_q][2]))<=1){
						return _q;
					}
				}
			}
			else if(global.chartread[_q][0]=="TP"){
				if(_canread==0){
					if(608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25<mouse_y+30
					&&608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25>mouse_y-10
					&&round((mouse_x-257)/102-real(global.chartread[_q][2]))>=0
					&&round((mouse_x-257)/102-real(global.chartread[_q][2]))<=2){
						return _q;
					}
				}
			}
			else if(global.chartread[_q][0]=="QP"){
				if(_canread==0){
					if(608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25<mouse_y+30
					&&608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25>mouse_y-10
					&&round((mouse_x-257)/102-real(global.chartread[_q][2]))>=0
					&&round((mouse_x-257)/102-real(global.chartread[_q][2]))<=3){
						return _q;
					}
				}
			}
			
			if(_canread==1){
				if(608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25<mouse_y+30
				&&608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25>mouse_y-10
				&&round((mouse_x-257)/102-real(global.chartread[_q][2]))==0){
					return _q;
				}
				else _canread=0;
			}
		}
		_q--;
	
	}
	if(_type==1) return(scr_getmousenote(0));
	return -1;
}