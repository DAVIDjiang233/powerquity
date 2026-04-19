function scr_qwertyuiop_ctrl(){
	if keyboard_check_pressed(global.press[4]) {
		if lkgon==1 lkgon=0;else lkgon=1;
		if lkgon=0{
			if global.pressing[0]>=2 {global.pressing[0]=1;}
			if global.pressing[0]>=2 {global.pressing[1]=1;}
		}
		else{
			if keyboard_check(global.press[5]) {global.pressing[1]=3;}
			else {global.pressing[0]=3;}
		}
	}
	
	
	if keyboard_check_pressed(global.press[5]){ 
		if lkgon==1{
			global.pressing[1]=3;
			global.pressing[0]=1;
		}
	}
	if keyboard_check_released(global.press[5]){ 
		if lkgon==1
		{
			global.pressing[0]=3;
			global.pressing[1]=1;
		}
	}
		
	if keyboard_check_pressed(global.press[6]) {global.pressing[2]=3;}
	if keyboard_check_pressed(global.press[7]) {global.pressing[3]=3;}


	
	if keyboard_check_released(global.press[6]) {global.pressing[2]=1;}
	if keyboard_check_released(global.press[7]) {global.pressing[3]=1;}
}