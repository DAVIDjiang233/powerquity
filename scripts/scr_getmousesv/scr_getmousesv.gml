function scr_getmousesv(timinggroup,_type){
	if(timinggroup>=0){
		if(!keyboard_check(vk_tab)){
			if(round((mouse_x-257)/102)==1&&array_length(global.svchange[5])>=timinggroup){
				var _svst=scr_svget(global.svchange[5][timinggroup],global.playtime-1000,0);
				var _svet=scr_svget(global.svchange[5][timinggroup],global.playtime+5000,0);
				while(_svst<_svet){
					_svst++;
					var _ydo=(global.playtime-global.svchange[5][timinggroup][_svst][0])*0.25*global.globalspeed+610;
					if(_ydo<mouse_y+30&&_ydo>mouse_y-30){
						return([5,_svst])
					}
				}
			}
			else if(round((mouse_x-257)/102)==2&&array_length(global.svchange[6])>=timinggroup){
				var _svst=scr_svget(global.svchange[6][timinggroup],global.playtime-1000,0);
				var _svet=scr_svget(global.svchange[6][timinggroup],global.playtime+5000,0);
				while(_svst<_svet){
					_svst++;
					var _ydo=(global.playtime-global.svchange[6][timinggroup][_svst][0])*0.25*global.globalspeed+610;
					if(_ydo<mouse_y+30&&_ydo>mouse_y-30){
						return([6,_svst])
					}
				}
			}
			else if(round((mouse_x-257)/102)==3&&array_length(global.svchange[7])>=timinggroup){
				var _svst=scr_svget(global.svchange[7][timinggroup],global.playtime-1000,0);
				var _svet=scr_svget(global.svchange[7][timinggroup],global.playtime+5000,0);
				while(_svst<_svet){
					_svst++;
					var _ydo=(global.playtime-global.svchange[7][timinggroup][_svst][0])*0.25*global.globalspeed+610;
					if(_ydo<mouse_y+30&&_ydo>mouse_y-30){
						return([7,_svst])
					}
				}
			}
			else if(round((mouse_x-257)/102)==4&&array_length(global.svchange[8])>=timinggroup){
				var _svst=scr_svget(global.svchange[8][timinggroup],global.playtime-1000,0);
				var _svet=scr_svget(global.svchange[8][timinggroup],global.playtime+5000,0);
				while(_svst<_svet){
					_svst++;
					var _ydo=(global.playtime-global.svchange[8][timinggroup][_svst][0])*0.25*global.globalspeed+610;
					if(_ydo<mouse_y+30&&_ydo>mouse_y-30){
						return([8,_svst])
					}
				}
			}
	
		}
		
			if(round((mouse_x-257)/102)==0&&array_length(global.svchange[0])>=timinggroup){
				var _svst=scr_svget(global.svchange[0][timinggroup],global.playtime-1000,0);
				var _svet=scr_svget(global.svchange[0][timinggroup],global.playtime+5000,0);
				while(_svst<_svet){
					_svst++;
					var _ydo=(global.playtime-global.svchange[0][timinggroup][_svst][0])*0.25*global.globalspeed+610;
					if(_ydo<mouse_y+30&&_ydo>mouse_y-30){
						return([0,_svst])
					}
				}
			}
			else if(round((mouse_x-257)/102)==1&&array_length(global.svchange[1])>=timinggroup){
				var _svst=scr_svget(global.svchange[1][timinggroup],global.playtime-1000,0);
				var _svet=scr_svget(global.svchange[1][timinggroup],global.playtime+5000,0);
				while(_svst<_svet){
					_svst++;
					var _ydo=(global.playtime-global.svchange[1][timinggroup][_svst][0])*0.25*global.globalspeed+610;
					if(_ydo<mouse_y+30&&_ydo>mouse_y-30){
						return([1,_svst])
					}
				}
			}
			else if(round((mouse_x-257)/102)==2&&array_length(global.svchange[2])>=timinggroup){
				var _svst=scr_svget(global.svchange[2][timinggroup],global.playtime-1000,0);
				var _svet=scr_svget(global.svchange[2][timinggroup],global.playtime+5000,0);
				while(_svst<_svet){
					_svst++;
					var _ydo=(global.playtime-global.svchange[2][timinggroup][_svst][0])*0.25*global.globalspeed+610;
					if(_ydo<mouse_y+30&&_ydo>mouse_y-30){
						return([2,_svst])
					}
				}
			}
			else if(round((mouse_x-257)/102)==3&&array_length(global.svchange[3])>=timinggroup){
				var _svst=scr_svget(global.svchange[3][timinggroup],global.playtime-1000,0);
				var _svet=scr_svget(global.svchange[3][timinggroup],global.playtime+5000,0);
				while(_svst<_svet){
					_svst++;
					var _ydo=(global.playtime-global.svchange[3][timinggroup][_svst][0])*0.25*global.globalspeed+610;
					if(_ydo<mouse_y+30&&_ydo>mouse_y-30){
						return([3,_svst])
					}
				}
			}
			else if(round((mouse_x-257)/102)==4&&array_length(global.svchange[4])>=timinggroup){
				var _svst=scr_svget(global.svchange[4][timinggroup],global.playtime-1000,0);
				var _svet=scr_svget(global.svchange[4][timinggroup],global.playtime+5000,0);
				while(_svst<_svet){
					_svst++;
					var _ydo=(global.playtime-global.svchange[4][timinggroup][_svst][0])*0.25*global.globalspeed+610;
					if(_ydo<mouse_y+30&&_ydo>mouse_y-30){
						return([4,_svst])
					}
				}
			}
		
	}
	
	
	return [-1,0];
}