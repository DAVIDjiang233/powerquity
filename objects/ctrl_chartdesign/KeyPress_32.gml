if chartplay==0{
	starttime=current_time-global.playtime/global.musicspeed;
	chartplay=1;
	
}
else {
	chartplay=0;
	audio_stop_all();
}