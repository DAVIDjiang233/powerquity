if(mouseonbtn==0) exit;
if(global.rand[type]>=0.01){
	global.rand[type]-=0.01;
}
if keyboard_check(vk_shift){
	if(global.rand[type]>=0.04){
	global.rand[type]-=0.04;
	}
}
global.rand[type]=round(global.rand[type]*100)/100