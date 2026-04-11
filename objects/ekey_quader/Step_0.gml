y=yset(endtime);
x=xset(key1,endtime);
if(global.keytouchlist[key1]!=keyamo||global.keytouchlist[key1+1]!=keyamo2||global.keytouchlist[key1+2]!=keyamo3||global.keytouchlist[key1+3]!=keyamo4) exit;

if (global.playtime<endtime-125*global.judgesize) exit;
//miss
if (global.playtime>endtime+125*global.judgesize){
	if(global.autoplay==1) global.judgelist[0]++;
	else global.judgelist[3]++;
	global.keytouchlist[key1]=keyamo+0.5;
	global.keytouchlist[key1+1]=keyamo2+0.5;
	global.keytouchlist[key1+2]=keyamo3+0.5;
	global.keytouchlist[key1+3]=keyamo4+0.5;
	instance_destroy(showdetail);
	instance_create_depth(640,0,-1145,showdetail);
	instance_destroy();
}



//press


if (keyboard_check_pressed(global.pressreal[key1])||keyboard_check_pressed(global.pressreal[key1+1])
||keyboard_check_pressed(global.pressreal[key1+2])||keyboard_check_pressed(global.pressreal[key1+3])){
	if(exjudge==0){
		global.judgelist[0]++;
	}
	else{
		judge(endtime);
		instance_create_depth(640+(global.playtime-endtime)/global.judgesize,global.settings[9],-1145,showhit);
	}
	global.keytouchlist[key1]=keyamo+0.2;
	global.keytouchlist[key1+1]=keyamo2+0.2;
	global.keytouchlist[key1+2]=keyamo3+0.2;
	global.keytouchlist[key1+3]=keyamo4+0.2;
	instance_destroy();
}