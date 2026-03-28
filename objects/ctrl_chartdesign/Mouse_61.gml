if (global.mouseonbtn==1) exit;

if keyboard_check(vk_control){
	if (designview!=2&&global.barline>0){
		if keyboard_check(vk_shift){
			global.barline--;
		}
		else{
			global.barline=ceil(global.barline/2);
		}
	}
}
else if keyboard_check(vk_shift){
	if (global.globalspeed>1.11){
		global.globalspeed-=0.1;
	}
	if (global.globalspeed>0.61){
		global.globalspeed-=0.1;
	}
	else global.globalspeed=0.5;
}
else{
	if chartplay==1 exit;
	global.playtime-=200/global.globalspeed;
	scr_listchange(-1);
}
