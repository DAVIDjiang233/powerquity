y=yset(endtime);
x=xset(key1,endtime);

if (global.playtime<endtime-15*global.judgesize) exit;
//miss
if (global.playtime>endtime+15*global.judgesize){
	global.judgelist[0]++;
	instance_destroy();
}



//press
if keyboard_check(global.pressreal[key1]){
		global.judgelist[3]++;
		instance_destroy(showdetail);
		instance_create_depth(640,0,-1145,showdetail);
		instance_destroy();
}

