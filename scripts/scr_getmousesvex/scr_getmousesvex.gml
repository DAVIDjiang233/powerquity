function scr_getmousesvex(timinggroup,_type){
	if(timinggroup>=0){
		if(round((mouse_x-257)/102)==0){
				
			if(array_length(global.svchange[0])>=timinggroup){
				var _svst=scr_svget(global.svchange[0][timinggroup],global.playtime-1000,0);
				if(_type==1&&array_length(global.svchoose[0])>=1) _svst=global.svchoose[0][array_length(global.svchoose[0])-1];
					
				var _svet=scr_svget(global.svchange[0][timinggroup],global.playtime+5000,0);
				while(_svst<_svet){
					_svst++;
					var _ydo=(global.playtime-global.svchange[0][timinggroup][_svst][0])*0.25*global.globalspeed+610;
					if(_ydo<mouse_y+30&&_ydo>mouse_y-30){
						return([0,_svst]);
					}
				}
			}
		}
		else if(round((mouse_x-257)/102)>=1&&round((mouse_x-257)/102)<=4){
			var _track=round((mouse_x-257)/102);
			if(_type==1&&array_length(global.svchoose[_track+4])>=1){
				var _svst=global.svchoose[_track+4][array_length(global.svchoose[_track+4])-1];
				var _svet=scr_svget(global.svchange[_track+4][timinggroup],global.playtime+5000,0);
				while(_svst<_svet){
					_svst++;
					var _ydo=(global.playtime-global.svchange[_track+4][timinggroup][_svst][0])*0.25*global.globalspeed+610;
					if(_ydo<mouse_y+30&&_ydo>mouse_y-30){
						return([_track+4,_svst])
					}
				}
			}
			if(array_length(global.svchange[_track])>=timinggroup){
				var _svst=scr_svget(global.svchange[_track][timinggroup],global.playtime-1000,0);
				if(_type==1&&array_length(global.svchoose[_track])>=1) _svst=global.svchoose[_track][array_length(global.svchoose[_track])-1];
				var _svet=scr_svget(global.svchange[_track][timinggroup],global.playtime+5000,0);
				while(_svst<_svet){
					_svst++;
					var _ydo=(global.playtime-global.svchange[_track][timinggroup][_svst][0])*0.25*global.globalspeed+610;
					if(_ydo<mouse_y+30&&_ydo>mouse_y-30){
						return([_track,_svst])
					}
				}
			}
			if(array_length(global.svchange[_track+4])>=timinggroup){
				var _svst=scr_svget(global.svchange[_track+4][timinggroup],global.playtime-1000,0);
				if(_type==1&&array_length(global.svchoose[_track+4])>=1) _svst=global.svchoose[_track+4][array_length(global.svchoose[_track+4])-1];
				var _svet=scr_svget(global.svchange[_track+4][timinggroup],global.playtime+5000,0);
				while(_svst<_svet){
					_svst++;
					var _ydo=(global.playtime-global.svchange[_track+4][timinggroup][_svst][0])*0.25*global.globalspeed+610;
					if(_ydo<mouse_y+30&&_ydo>mouse_y-30){
						return([_track+4,_svst])
					}
				}
			}
		}
		
	}
	
	if(_type==1) return(scr_getmousesvex(timinggroup,0));
	return [-1,0];
}