if global.playtype==1 exit;
if ctrl_playgame.gamepause!=1 exit;


if mouse_check_button_released(mb_left){
	if (pressedtype==0){
		exit;
	}
	if pressedtype<5{
		var _change=scr_getmoustdlt();
		if(_change>=5){
			global.pressreal[pressedtype-1]=_change-5;
		}
	}
	else{
		var _change=scr_getmoustdlt();
		if(_change>0&&_change<5){
			global.pressreal[_change-1]=pressedtype-5;
		}
	}
	pressedtype=0;
}