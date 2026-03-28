if ctrl_playgame.gamepause!=0 exit; 
with(ctrl_playgame){
	global.playtime=(current_time-startime-pausetime)*global.gamespeed-2000;
}