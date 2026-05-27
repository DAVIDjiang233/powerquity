function judge(_time){
	global.textlist[2]++;
	global.textlist[3]++;
	global.textlist[4]++;
	if (global.playtime<_time-125*global.judgesize) {
		global.textlist[4]=0;
		global.textlist[3]=0;
		global.textlist[2]=0;
		global.textlist[13]++;
		return 3;
	}
	else if (global.playtime<_time-80*global.judgesize||global.playtime>_time+80*global.judgesize) {
		global.textlist[4]=0;
		global.textlist[3]=0;
		global.textlist[12]++;
		global.textlist[28]+=global.playtime-_time;
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
		global.textlist[4]=0;
		global.textlist[11]++;
		global.textlist[28]+=global.playtime-_time;
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
		global.textlist[10]++;
		global.textlist[28]+=global.playtime-_time;
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