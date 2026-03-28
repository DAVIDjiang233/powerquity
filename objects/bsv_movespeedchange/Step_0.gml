if ctrl_playgame.gamepause!=0 exit; 
	if (global.playtime<etime){
		var _q=scr_tcscal(stime,etime,0,oriamont,global.playtime,movetype);
		global.chartmoveinspeed[timinggroup]+=_q-amont;
		amont=_q;
	}
	else {
		global.chartmoveinspeed[timinggroup]+=oriamont-amont;
		instance_destroy();
	}
	