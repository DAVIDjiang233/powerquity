if confirmt==1 exit;
if chartloading==1 exit;
if chartediting==1 exit;
if moding==1{
	var _min=0.2;
	if(debug_mode) _min=0.05;
	if modtype==2 {
		global.gamespeed-=0.01;
		if (!keyboard_check(vk_control)){
			global.gamespeed-=0.04;
			if (keyboard_check(vk_shift)){
				global.gamespeed-=0.2;
			}
		}
		if(global.gamespeed)<_min{
			global.gamespeed=_min;
		}
	}
	if modtype==3 {
		global.judgesize-=0.01;
		if (!keyboard_check(vk_control)){
			global.judgesize-=0.04;
			if (keyboard_check(vk_shift)){
				global.judgesize-=0.2;
			}
		}
		if(global.judgesize)<_min{
			global.judgesize=_min;
		}
	}
}
else{
	if array_length(global.filelist)==0 exit;
if global.level==0 exit;


global.level--;
readfile();
}