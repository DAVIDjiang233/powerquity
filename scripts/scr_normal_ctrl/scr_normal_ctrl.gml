function scr_normal_ctrl(){
	if keyboard_check_pressed(global.press[0]) {global.pressing[0]=3;}
	if keyboard_check_pressed(global.press[1]) {global.pressing[1]=3;}
	if keyboard_check_pressed(global.press[2]) {global.pressing[2]=3;}
	if keyboard_check_pressed(global.press[3]) {global.pressing[3]=3;}

	if keyboard_check_released(global.press[0]) {global.pressing[0]=1;}
	if keyboard_check_released(global.press[1]) {global.pressing[1]=1;}
	if keyboard_check_released(global.press[2]) {global.pressing[2]=1;}
	if keyboard_check_released(global.press[3]) {global.pressing[3]=1;}
}