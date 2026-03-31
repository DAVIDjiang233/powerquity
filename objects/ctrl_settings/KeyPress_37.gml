if (changekey==0){
	if (setbase==0) setbase=array_length(settingall)-1;
	else setbase--;
	if (settype>settingall[setbase]){
		settype=settingall[setbase];
	}
}
else{
	if(setbase==2&&settype==0&&global.settings[1]!=1){ 
		global.settings[1]=real(global.settings[1])-1;
		window_set_size(320*real(global.settings[1]), 184*real(global.settings[1]));
		window_set_position(window_get_x()+160,window_get_y()+92)
	}
	else if (setbase==2&&settype>=2&&settype<=4){
		global.settings[settype+6]-=1;
		if !keyboard_check(vk_control){
			global.settings[settype+6]-=9;
			if keyboard_check(vk_shift) global.settings[settype+6]-=40;
		}
	}
	else if (setbase==2&&settype==5){
		global.settings[17]-=1;
		if !keyboard_check(vk_control) {
			global.settings[17]-=9;
			if keyboard_check(vk_shift) global.settings[17]-=40;
		}
		if global.settings[17]<=60 global.settings[17]=60;
	}
	
	else if (setbase==3&&settype==0){
		global.settings[0]=real(global.settings[0])-0.1;
		if !keyboard_check(vk_control){
			global.settings[0]=real(global.settings[0])-0.4;
			if keyboard_check(vk_shift) global.settings[0]-=0.5;
		}
		if global.settings[0]<=0 global.settings[0]=0.1;
	}
	else if (setbase==3&&settype==3){
		global.settings[6]=real(global.settings[6])-1;
		if !keyboard_check(vk_control){
			global.settings[6]=real(global.settings[6])-9;
			if keyboard_check(vk_shift) global.settings[6]-=40;
		}
	}
}