if confirmt==1 exit;
if chartloading==1 exit;
if chartediting==1 exit;
if moding==1{
	if modtype==2 {
		global.gamespeed+=0.01;
		if (!keyboard_check(vk_control)){
			global.gamespeed+=0.04;
			if (keyboard_check(vk_shift)){
				global.gamespeed+=0.2;
			}
		}
		if(global.gamespeed)>3{
			global.gamespeed=3;
		}
	}
	if modtype==3 {
		global.judgesize+=0.01;
		if (!keyboard_check(vk_control)){
			global.judgesize+=0.04;
			if (keyboard_check(vk_shift)){
				global.judgesize+=0.2;
			}
		}
		if(global.judgesize)>3{
			global.judgesize=3;
		}
	}
}
else{

if array_length(global.filelist)==0 exit;
if global.level*2==array_length(global.fileread)-5 exit;

global.level++;
readfile();
}