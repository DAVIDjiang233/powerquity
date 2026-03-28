if pressed==1{

	if (mouse_x<828) x=828;
	else if (mouse_x>1212) x=1212;
	else x=mouse_x;
	
	global.playtime=(x-828)*global.musictime/384;
	
	global.list=0;
	scr_listchange(1);
	
	if mouse_check_button_released(mb_left){
		pressed=0;
		
		with ctrl_chartdesign{
			if chartplay==1{
				audio_stop_all();
				starttime=current_time-global.playtime/global.musicspeed;
				
			}
		
		}
	}
}
else x=384*(global.playtime/global.musictime)+828;