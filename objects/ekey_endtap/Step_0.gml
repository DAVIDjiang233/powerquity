y=yset(endtime);
x=xset(key1,endtime);

if(global.keytouchlist[key1]!=keyamo) exit;

if (global.playtime<endtime-150*global.judgesize) exit;
//miss
if (global.playtime>endtime+125*global.judgesize){
	if(global.autoplay==1) {
		global.judgelist[0]++;
		instance_create_depth(global.playskin[70]*(key1-2.5)+640,global.playskin[71],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[261+key1],
			sfps : global.playskin[411]
		}
		);
	}
	else {
		global.judgelist[3]++;
		instance_create_depth(global.playskin[70]*(key1-2.5)+640,global.playskin[71],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[276+key1],
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
		global.judgelist[3]++;
		instance_create_depth(global.playskin[70]*(key1-2.5)+640,global.playskin[71],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[272+key1],
			sfps : global.playskin[411]
		}
		);
		global.keytouchlist[key1]=keyamo+0.5;
		instance_destroy(showdetail);
		instance_create_depth(640,0,-5000,showdetail);
		instance_destroy();
	}


//relerase
if keyboard_check_released(global.pressreal[key1]){
	instance_create_depth(global.playskin[70]*(key1-2.5)+640,global.playskin[71],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[judge(endtime)*4+261+key1],
			sfps : global.playskin[411]
		}
		);
	global.keytouchlist[key1]=keyamo+0.5;
	instance_create_depth(640+(global.playtime-endtime)/global.judgesize,global.settings[9],-5000,showhit);
	instance_destroy();
}
