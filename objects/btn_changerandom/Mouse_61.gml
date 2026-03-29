if(mouseonbtn==0) exit;

global.rand[type]-=0.01;
if (!keyboard_check(vk_control)){
	global.rand[type]-=0.04;
	if keyboard_check(vk_shift){
		global.rand[type]-=0.05;
	}
}
if(global.rand[type]<0) global.rand[type]=0;
global.rand[type]=round(global.rand[type]*100)/100