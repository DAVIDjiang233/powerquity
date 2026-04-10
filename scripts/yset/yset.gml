function yset(_time){
	
	var _speed=0;
	
	if array_length(global.chartspeedtime[timinggroup])==1{
		_speed=(global.playtime-_time)*global.chartspeedtime[timinggroup][0][0];
	}
	else{
		if global.chartspeedtime[timinggroup][1][1]>_time{
			_speed=(global.playtime-_time)*global.chartspeedtime[timinggroup][0][0];
		}
		else {
			_speed=(global.playtime-global.chartspeedtime[timinggroup][1][1])
				*global.chartspeedtime[timinggroup][0][0];
			
			var _m=2;
			
			while(_m<array_length(global.chartspeedtime[timinggroup])&&_time>global.chartspeedtime[timinggroup][_m][1]){
				_speed+=(global.chartspeedtime[timinggroup][_m-1][1]-global.chartspeedtime[timinggroup][_m][1])
					*global.chartspeedtime[timinggroup][_m-1][0];
				_m++;
				
			}
			
			_speed+=(global.chartspeedtime[timinggroup][_m-1][1]-_time)
				*global.chartspeedtime[timinggroup][_m-1][0];
		}
	}
	
	var _y=global.playskin[71]+(_speed+global.chartmoveinspeed[timinggroup]*4)
	*global.globalspeed*0.25*global.chartspeed[timinggroup]
	+global.chartmoveinglobal[timinggroup];
	return _y;
}