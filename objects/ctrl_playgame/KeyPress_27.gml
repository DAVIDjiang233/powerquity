if alarm[1]>0 exit;
if gamepause==0{
	alarm[1]=fps;
	gamepause=1;
	pausestart=current_time;
	audio_pause_all();
}
else if gamepause==1 scr_restart();
