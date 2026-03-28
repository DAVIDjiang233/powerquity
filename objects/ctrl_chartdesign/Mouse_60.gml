if (global.mouseonbtn==1) exit;

if keyboard_check(vk_control){
	if (designview!=2){
		if keyboard_check(vk_shift){
			global.barline++;
		}
		else{
			if(global.barline<(15000/global.bpmlist[0][1])){
				global.barline=ceil(global.barline*2);
			}
		}
	}
}
else if keyboard_check(vk_shift){
	global.globalspeed+=0.1;
	if (global.globalspeed>1.02){
		global.globalspeed+=0.1;
	}
	
}
else{
	if chartplay==1 exit;
	global.playtime+=200/global.globalspeed;
	scr_listchange(1);
}
