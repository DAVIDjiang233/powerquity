if(mouseonbtn==0) exit;
if(global.musicspeed<1.98){
	global.musicspeed+=0.05;
	with(ctrl_chartdesign){
		if chartplay==1{
			audio_stop_all();
			starttime=current_time-global.playtime/global.musicspeed;
			audio_play_sound_ext({sound:musicplay,gain: 1,pitch: global.musicspeed,offset:((global.playtime-delay)/1000)});
		}
	}
}