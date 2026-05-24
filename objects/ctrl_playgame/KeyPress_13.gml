if gamepause==1{
	cursor_sprite=global.playskin[90];
	if(global.playskin[90]==gunmu){
		window_set_cursor(cr_default);
	}
	else{
		window_set_cursor(cr_none);
	}
	gamepause=2;
	alarmpause=current_time+1000;
	alarm[1]=0;
	global.drawdepth[25]=0;
}