function scr_judge(_time){
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
		if(global.textlist[2]>global.textlist[39]) global.textlist[39]=global.textlist[2];
		global.textlist[4]=0;
		global.textlist[3]=0;
		global.textlist[12]++;
		global.textlist[28]+=global.playtime-_time;
		global.tapcnt++;
		if(global.playtime-_time>global.textlist[31]){
			global.textlist[31]=global.playtime-_time;
		}
		if(global.playtime-_time<global.textlist[30]){
			global.textlist[30]=global.playtime-_time;
		}
		
		return 2;
	}
	else if (global.playtime<_time-40*global.judgesize||global.playtime>_time+40*global.judgesize) {
		if(global.textlist[2]>global.textlist[39]) global.textlist[39]=global.textlist[2];
		if(global.textlist[3]>global.textlist[40]) global.textlist[40]=global.textlist[3];
		global.textlist[4]=0;
		global.textlist[11]++;
		global.textlist[28]+=global.playtime-_time;
		global.tapcnt++;
		if(global.playtime-_time>global.textlist[31]){
			global.textlist[31]=global.playtime-_time;
		}
		if(global.playtime-_time<global.textlist[30]){
			global.textlist[30]=global.playtime-_time;
		}
		
		return 1;
	}
	else {
		if(global.textlist[2]>global.textlist[39]) global.textlist[39]=global.textlist[2];
		if(global.textlist[3]>global.textlist[40]) global.textlist[40]=global.textlist[3];
		if(global.textlist[4]>global.textlist[41]) global.textlist[41]=global.textlist[4];
		global.textlist[10]++;
		global.textlist[28]+=global.playtime-_time;
		global.tapcnt++;
		if(global.playtime-_time>global.textlist[31]){
			global.textlist[31]=global.playtime-_time;
		}
		if(global.playtime-_time<global.textlist[30]){
			global.textlist[30]=global.playtime-_time;
		}
		
		return 0;
	}
}