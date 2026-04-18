y=yset(endtime);
x=xset(key1,endtime);
if(global.keytouchlist[key1]!=keyamo) exit;

if (global.playtime<endtime-150*global.judgesize) exit;
//miss
if (global.playtime>endtime+125*global.judgesize){
	if(global.autoplay==1){
		global.judgelist[0]++;
		instance_create_depth(global.playskin[70]*(key1-2.5)+640,global.playskin[71],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[exjudge*8+174+key1],
			sfps : global.playskin[411]
		}
		);
	}
	else{
		global.judgelist[3]++;
		instance_create_depth(global.playskin[70]*(key1-2.5)+640,global.playskin[71],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[exjudge*20+178+key1],
			sfps : global.playskin[411]
		}
		);
	}
	global.keytouchlist[key1]=keyamo+0.5;
	instance_create_depth(640+(global.playtime-endtime)/global.judgesize,global.settings[9],-5000,showhit);
	instance_destroy();
}



//press
if keyboard_check_pressed(global.pressreal[key1]){
	if(exjudge==0){
		global.judgelist[0]++;
		instance_create_depth(global.playskin[70]*(key1-2.5)+640,global.playskin[71],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[174+key1],
			sfps : global.playskin[411]
		}
		);
	}
	else{
		instance_create_depth(global.playskin[70]*(key1-2.5)+640,global.playskin[71],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[judge(endtime)*4+182+key1],
			sfps : global.playskin[411]
		}
		);
		instance_create_depth(640+(global.playtime-endtime)/global.judgesize,global.settings[9],-5000,showhit);
	}
	global.keytouchlist[key1]=keyamo+0.5;
	instance_create_depth(640+(global.playtime-endtime)/global.judgesize,global.settings[9],-5000,showhit);
	instance_destroy();
}