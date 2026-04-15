y=yset(endtime);
x=xset(key1,endtime);

if(global.keytouchlist[key1]!=keyamo) exit;

if (global.playtime<endtime-150*global.judgesize) exit;
//miss
if (global.playtime>endtime+125*global.judgesize){
	if(global.autoplay==1) global.judgelist[0]++;
	else global.judgelist[3]++;
	global.keytouchlist[key1]=keyamo+0.5;
	instance_create_depth(640+(global.playtime-endtime)/global.judgesize,global.settings[9],-5000,showhit);
	instance_destroy();
}

//press
	if keyboard_check_pressed(global.pressreal[key1]){
		global.judgelist[3]++;
		global.keytouchlist[key1]=keyamo+0.5;
		instance_destroy(showdetail);
		instance_create_depth(640,0,-5000,showdetail);
		instance_destroy();
	}


//relerase
if keyboard_check_released(global.pressreal[key1]){
	judge(endtime);
	global.keytouchlist[key1]=keyamo+0.5;
	instance_create_depth(640+(global.playtime-endtime)/global.judgesize,global.settings[9],-5000,showhit);
	instance_destroy();
}
