function scr_qwertyuiop_ctrl(){
	if keyboard_check_pressed(global.press[4]) {
		if lkgon==1 lkgon=0;else lkgon=1;
		if lkgon=0{
			if keyboard_check(ord("1")) {keyboard_key_release(ord("1"));global.pressdet[1]=0;}
			if keyboard_check(ord("2")) {keyboard_key_release(ord("2"));global.pressdet[2]=0;}
		}
		else{
			if keyboard_check(global.press[5]) {keyboard_key_press(ord("2"));global.pressdet[2]=1;}
			else {keyboard_key_press(ord("1"));global.pressdet[1]=1;}
		}
	}
	
	
	if keyboard_check_pressed(global.press[5]){ 
		if lkgon==1
		{keyboard_key_press(ord("2"));global.pressdet[2]=1;}
		{keyboard_key_release(ord("1"));global.pressdet[1]=0;}
	}
	if keyboard_check_released(global.press[5]){ 
		if lkgon==1
		{keyboard_key_press(ord("1"));global.pressdet[1]=1;}
		{keyboard_key_release(ord("2"));global.pressdet[2]=0;}
	}
		
	if keyboard_check_pressed(global.press[6]) {keyboard_key_press(ord("3"));global.pressdet[3]=1;}
	if keyboard_check_pressed(global.press[7]) {keyboard_key_press(ord("4"));global.pressdet[4]=1;}


	
	if keyboard_check_released(global.press[6]) {keyboard_key_release(ord("3"));global.pressdet[3]=0;}
	if keyboard_check_released(global.press[7]) {keyboard_key_release(ord("4"));global.pressdet[4]=0;}
}