
if ctrl_playgame.gamepause!=0 exit; 
	if (global.playtime<etime){
		var _q=scr_tcscal(stime,etime,0,oriamont,global.playtime,movetype);
		global.bloom[timinggroup]+=_q-amont;
		amont=_q;
	}
	else {
		global.bloom[timinggroup]+=oriamont-amont;
		instance_destroy();
	}
	