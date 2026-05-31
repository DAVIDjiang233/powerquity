y=scr_yset(endtime);
x=xset(key1,endtime);
if(global.textlist[20+key1]!=keyamo) exit;

if (global.playtime<endtime-150*global.judgesize) exit;
//miss
if (global.playtime>endtime+125*global.judgesize){
	if(global.autoplay==1){
		global.textlist[2]++;
		global.textlist[3]++;
		global.textlist[4]++;
		if(global.textlist[2]>global.textlist[39]) global.textlist[39]=global.textlist[2];
		if(global.textlist[3]>global.textlist[40]) global.textlist[40]=global.textlist[3];
		if(global.textlist[4]>global.textlist[41]) global.textlist[41]=global.textlist[4];
		global.textlist[10]++;
		instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[exjudge*8+174+key1],
			sfps : global.skinnumber[23]
		}
		);
	}
	else{
		global.textlist[2]=0;
		global.textlist[3]=0;
		global.textlist[4]=0;
		global.textlist[13]++;
		instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[exjudge*20+178+key1],
			sfps : global.skinnumber[23]
		}
		);
	}
	global.textlist[20+key1]=keyamo+0.5;
	instance_create_depth((global.playtime-endtime)/global.judgesize,global.settings[9],-5000,showhit);
	instance_destroy();
}



//press
if global.pressing[global.pressreal[key1-1]]==3{
	if(exjudge==0){
		global.textlist[2]++;
		global.textlist[3]++;
		global.textlist[4]++;
		if(global.textlist[2]>global.textlist[39]) global.textlist[39]=global.textlist[2];
		if(global.textlist[3]>global.textlist[40]) global.textlist[40]=global.textlist[3];
		if(global.textlist[4]>global.textlist[41]) global.textlist[41]=global.textlist[4];
		global.textlist[10]++;
		instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[174+key1],
			sfps : global.skinnumber[23]
		}
		);
	}
	else{
		instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[scr_judge(endtime)*4+182+key1],
			sfps : global.skinnumber[23]
		}
		);
		instance_create_depth((global.playtime-endtime)/global.judgesize,global.settings[9],-5000,showhit);
	}
	global.textlist[20+key1]=keyamo+0.5;
	instance_create_depth((global.playtime-endtime)/global.judgesize,global.settings[9],-5000,showhit);
	instance_destroy();
}