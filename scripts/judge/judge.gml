function judge(_time){
	if (global.playtime<_time-125*global.judgesize) global.judgelist[3]++;
	else if (global.playtime<_time-80*global.judgesize||global.playtime>_time+80*global.judgesize) {
		global.judgelist[2]++;
		global.timingcnt+=global.playtime-_time;
		global.tapcnt++;
		if(global.playtime-_time>global.maxel[1]){
			global.maxel[1]=global.playtime-_time;
		}
		if(global.playtime-_time<global.maxel[0]){
			global.maxel[0]=global.playtime-_time;
		}
		show_debug_message(global.maxel);
	}
	else if (global.playtime<_time-40*global.judgesize||global.playtime>_time+40*global.judgesize) {
		global.judgelist[1]++;
		global.timingcnt+=global.playtime-_time;
		global.tapcnt++;
		if(global.playtime-_time>global.maxel[1]){
			global.maxel[1]=global.playtime-_time;
		}
		if(global.playtime-_time<global.maxel[0]){
			global.maxel[0]=global.playtime-_time;
		}
		show_debug_message(global.maxel);
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
		show_debug_message(global.maxel);
	}
}