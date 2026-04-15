y=yset(endtime);
x=xset(key1,endtime);

if (global.playtime<endtime-150) exit;
//miss
if(global.autoplay==1){
	if (global.playtime>endtime){
	global.judgelist[0]++;
	instance_destroy();
	}
}
else if (global.playtime>endtime+125){
	global.judgelist[3]++;
	instance_destroy(showdetail);
	instance_create_depth(640,0,-5000,showdetail);
	instance_destroy();
}


//press
if keyboard_check(global.pressreal[key1]){
	judged=1;
}
if(global.playtime>endtime&&judged==1){
	global.judgelist[0]++;
	instance_destroy();
}
