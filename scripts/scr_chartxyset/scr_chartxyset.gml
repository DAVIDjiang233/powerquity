function scr_chartxyset(_time,_key,_timinggroup){
	var _x=385+102*_key+global.chartxmove[_timinggroup];
	
	var _i=scr_svget(global.svchange[0][_timinggroup],global.playtime,0)
	
	var _speed=0;
	if(_i!=-1){
		_speed=(global.playtime-global.svchange[0][_timinggroup][_i][0])*global.svchange[0][_timinggroup][_i][1];
		while(array_length(global.svchange[0][_timinggroup])>_i&&global.svchange[0][_timinggroup][_i][0]<_time){
			if(array_length(global.svchange[0][_timinggroup])>_i+1&&global.svchange[0][_timinggroup][_i+1][0]<_time){
				_speed-=(global.svchange[0][_timinggroup][_i+1][0]-global.svchange[0][_timinggroup][_i][0])*global.svchange[0][_timinggroup][_i][1];
			}
			else{
				_speed-=(_time-global.svchange[0][_timinggroup][_i][0])*global.svchange[0][_timinggroup][_i][1];
			}
			_i++;
		}
	
	}
	
	var _y=608+(_speed+global.chartmoveinspeed[_timinggroup]*4)
	*global.globalspeed*0.25*global.chartspeed[_timinggroup]
	+global.chartmoveinglobal[_timinggroup];
	
	return([_x,_y]);
}