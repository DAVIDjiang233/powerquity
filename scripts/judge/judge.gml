function judge(_time){
	global.playtextlist[1]++;
	global.playtextlist[2]++;
	global.playtextlist[3]++;
	if (global.playtime<_time-125*global.judgesize) {
		global.playtextlist[3]=0;
		global.playtextlist[2]=0;
		global.playtextlist[1]=0;
		global.judgelist[3]++;
		return 3;
	}
	else if (global.playtime<_time-80*global.judgesize||global.playtime>_time+80*global.judgesize) {
		global.playtextlist[3]=0;
		global.playtextlist[2]=0;
		global.judgelist[2]++;
		global.timingcnt+=global.playtime-_time;
		global.tapcnt++;
		if(global.playtime-_time>global.maxel[1]){
			global.maxel[1]=global.playtime-_time;
		}
		if(global.playtime-_time<global.maxel[0]){
			global.maxel[0]=global.playtime-_time;
		}
		//show_debug_message(global.maxel);
		return 2;
	}
	else if (global.playtime<_time-40*global.judgesize||global.playtime>_time+40*global.judgesize) {
		global.playtextlist[3]=0;
		global.judgelist[1]++;
		global.timingcnt+=global.playtime-_time;
		global.tapcnt++;
		if(global.playtime-_time>global.maxel[1]){
			global.maxel[1]=global.playtime-_time;
		}
		if(global.playtime-_time<global.maxel[0]){
			global.maxel[0]=global.playtime-_time;
		}
		//show_debug_message(global.maxel);
		return 1;
	}
	else {
		global.judgelist[0]++;
		global.timingcnt+=global.playtime-_time;
		global.tapcnt++;
		if(global.playtime-_time>global.maxel[1]){
			global.maxel[1]=global.playtime-_time;
		}
		if(global.playtime-_time<global.maxel[0]){
			global.maxel[0]=global.playtime-_time;
		}
		//show_debug_message(global.maxel);
		return 0;
	}
}