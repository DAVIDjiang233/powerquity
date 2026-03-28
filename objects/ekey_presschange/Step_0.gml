y=yset(endtime);
x=xset(key1,endtime);
depth=depth+0.1;
//dest
if (global.playtime>endtime){
	if (global.playtype==2&&global.settings[11]==1) global.pressreal[key1]=ord(changebar);
	instance_destroy();
}