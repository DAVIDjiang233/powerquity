if alarm[1]>0 exit;
if gamepause==0{
	cursor_sprite=global.playskin[91];
	if(global.playskin[91]==gunmu){
		window_set_cursor(cr_default);
	}
	else{
		window_set_cursor(cr_none);
	}
	alarm[1]=fps;
	gamepause=1;
	pausestart=current_time;
	audio_pause_all();
	global.drawdepth[25]=1;
}
else if (gamepause==1) {
	audio_destroy_stream(musicplay);
	scr_restart();
}