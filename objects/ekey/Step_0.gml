y=yset(endtime);
x=xset(key1,endtime);
if(global.keytouchlist[key1]!=keyamo) exit;

if (global.playtime<endtime-150*global.judgesize) exit;
//miss
if (global.playtime>endtime+125*global.judgesize){
	if(global.autoplay==1) global.judgelist[0]++;
	else global.judgelist[3]++;
	global.keytouchlist[key1]=keyamo+0.5;
	instance_create_depth(640+(global.playtime-endtime)/global.judgesize,global.settings[9],-1145,showhit);
	instance_destroy();
}



//press
if keyboard_check_pressed(global.pressreal[key1]){
	if(exjudge==0){
		global.judgelist[0]++;
	}
	else{
		judge(endtime);
		instance_create_depth(640+(global.playtime-endtime)/global.judgesize,global.settings[9],-1145,showhit);
	}
	global.keytouchlist[key1]=keyamo+0.5;
	instance_create_depth(640+(global.playtime-endtime)/global.judgesize,global.settings[9],-1145,showhit);
	instance_destroy();
}