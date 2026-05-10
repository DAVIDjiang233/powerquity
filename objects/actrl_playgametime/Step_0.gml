if ctrl_playgame.gamepause!=0 exit; 
with(ctrl_playgame){
	global.playtime=(current_time-startime-pausetime-1500)*global.gamespeed-500;
}
if(global.judgelist[0]+global.judgelist[1]+global.judgelist[2]+global.judgelist[3]!=0){
	global.playtextlist[0]=string_format(100*(global.judgelist[0]+global.judgelist[1]*0.75+global.judgelist[2]*0.5)
		  /(global.judgelist[0]+global.judgelist[1]+global.judgelist[2]+global.judgelist[3]),0,2);
}