if(mouseonbtn==0) exit;
global.musicspeed-=0.01;
if (!keyboard_check(vk_control)){
	global.musicspeed-=0.04;
	if keyboard_check(vk_shift){
		global.musicspeed-=0.05;
	}
}
if(global.musicspeed<=0.2) global.musicspeed=0.2;
with(ctrl_chartdesign){
	if chartplay==1{
		audio_stop_all();
		starttime=current_time-global.playtime/global.musicspeed;
		audio_play_sound_ext({sound:musicplay,gain: 1,pitch: global.musicspeed,offset:((global.playtime-delay)/1000)});
	}
}