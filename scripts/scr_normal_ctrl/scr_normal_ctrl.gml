function scr_normal_ctrl(){
	if keyboard_check_pressed(global.press[0]) {keyboard_key_press(ord("1"));global.pressdet[1]=1;}
	if keyboard_check_pressed(global.press[1]) {keyboard_key_press(ord("2"));global.pressdet[2]=1;}
	if keyboard_check_pressed(global.press[2]) {keyboard_key_press(ord("3"));global.pressdet[3]=1;}
	if keyboard_check_pressed(global.press[3]) {keyboard_key_press(ord("4"));global.pressdet[4]=1;}

	if keyboard_check_released(global.press[0]) {keyboard_key_release(ord("1"));global.pressdet[1]=0;}
	if keyboard_check_released(global.press[1]) {keyboard_key_release(ord("2"));global.pressdet[2]=0;}
	if keyboard_check_released(global.press[2]) {keyboard_key_release(ord("3"));global.pressdet[3]=0;}
	if keyboard_check_released(global.press[3]) {keyboard_key_release(ord("4"));global.pressdet[4]=0;}
}