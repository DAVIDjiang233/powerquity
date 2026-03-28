draw_set_halign(fa_left);
draw_set_font(global.fontall);
draw_set_colour(c_white);
draw_set_alpha(1);
//draw_text(192, 576, "judgelist"+string(global.judgelist));
if global.settings[7]==1{
	
	
	if(global.mirror!=1){
		draw_text_transformed(100, 500,"Perfect:",0.3,0.3,0);
		draw_text_transformed(100, 540,"Great:",0.3,0.3,0);
		draw_text_transformed(100, 580,"Good:",0.3,0.3,0);
		draw_text_transformed(100, 620,"Miss:",0.3,0.3,0);
		draw_text_transformed(240, 500,global.judgelist[0],0.3,0.3,0);
		draw_text_transformed(240, 540,global.judgelist[1],0.3,0.3,0);
		draw_text_transformed(240, 580,global.judgelist[2],0.3,0.3,0);
		draw_text_transformed(240, 620,global.judgelist[3],0.3,0.3,0);
	}
	else{
		draw_text_transformed(1180, 500,"Perfect:",-0.3,0.3,0);
		draw_text_transformed(1180, 540,"Great:",-0.3,0.3,0);
		draw_text_transformed(1180, 580,"Good:",-0.3,0.3,0);
		draw_text_transformed(1180, 620,"Miss:",-0.3,0.3,0);
		draw_text_transformed(1040, 500,global.judgelist[0],-0.3,0.3,0);
		draw_text_transformed(1040, 540,global.judgelist[1],-0.3,0.3,0);
		draw_text_transformed(1040, 580,global.judgelist[2],-0.3,0.3,0);
		draw_text_transformed(1040, 620,global.judgelist[3],-0.3,0.3,0);
	}
}

var _fps="FPS: "+string_format(fps,0,0)
if(global.mirror!=1){
	draw_text_transformed(90, 60,_fps,0.3,0.3,0);
	
	draw_text_transformed(90+(string_width(_fps)*0.3), 70,"/"+string(global.settings[17]),0.15,0.15,0);
}
else{
	draw_text_transformed(1190, 60,_fps,-0.3,0.3,0);
	draw_text_transformed(1190-(string_width(_fps)*0.3), 70,"/"+string(global.settings[17]),-0.15,0.15,0);
}
if (startime>current_time+9000000){
	draw_text_transformed(640, 160, "谱面加载中",2*(0.5-global.mirror),1,0);

}

if debug_mode{
	draw_text_transformed(192, 300, string(global.playtime),0.2,0.2,0);
	draw_text_transformed(888, 616, "keylist"+string(global.keylist),0.2,0.2,0);
	draw_text_transformed(888, 676, "keytouchlist"+string(global.keytouchlist),0.2,0.2,0);
	//draw_text_transformed(888, 676, string(global.chartmoveinspeed[0]),0.2,0.2,0);
	
	
	for(var _i=0;_i<4;_i++){
		for(var _j=0;_j<array_length(autopress[_i]);_j++){
			var _time=(global.playtime-autopress[_i][_j][1])*global.globalspeed/7+608;
			if(autopress[_i][_j][0]=="N") draw_set_colour(c_lime);
			else if(autopress[_i][_j][0]=="M") draw_set_colour(#ffaa00);
			else draw_set_colour(c_aqua);
			draw_line_width((_i*50)+850,_time,(_i*50)+900,_time,5);
			draw_text_transformed((_i*50)+875, _time,_j,0.3,0.3,0);
		}
	}
	for(var _i=0;_i<4;_i++){
		for(var _j=0;_j<array_length(autopress2[_i]);_j++){
			if(autopress2[_i][_j][0]=="A") {
				var _time=(global.playtime-autopress2[_i][_j][1])*global.globalspeed/7+608;
				draw_set_colour(c_yellow);
				draw_line_width((_i*50)+850,_time,(_i*50)+900,_time,5);
				draw_text_transformed((_i*50)+875, _time,_j,0.3,0.3,0);
			}
		}
	}
	draw_set_colour(c_red);
	for(var _i=0;_i<4;_i++){
		for(var _j=0;_j<array_length(autorelease[_i]);_j++){
			var _time=(global.playtime-autorelease[_i][_j])*global.globalspeed/7+608;
			draw_line_width((_i*50)+850,_time,(_i*50)+900,_time,5);
			draw_text_transformed((_i*50)+875, _time,_j,0.3,0.3,0);
		}
	}
	draw_set_colour(c_white);
}

draw_set_halign(fa_center);
if(global.judgelist[0]+global.judgelist[1]+global.judgelist[2]!=0){
	if(global.mirror!=1){
		draw_text_transformed(640, global.settings[8], string_format(100*(global.judgelist[0]+global.judgelist[1]*0.75+global.judgelist[2]*0.5)
		  /(global.judgelist[0]+global.judgelist[1]+global.judgelist[2]+global.judgelist[3]),0,2)+"%",0.3,0.3,0);
	}
	else{
		draw_text_transformed(640, global.settings[8], string_format(100*(global.judgelist[0]+global.judgelist[1]*0.75+global.judgelist[2]*0.5)
		  /(global.judgelist[0]+global.judgelist[1]+global.judgelist[2]+global.judgelist[3]),0,2)+"%",-0.3,0.3,0);
	}
}
if (alarmpause>current_time){
	draw_text_transformed(640, 288,(alarmpause-current_time)/1000,0.6*(0.5-global.mirror),0.3,0);
}
/*
if keyboard_check(ord("1")) draw_text(480, 640,"1");
if keyboard_check(ord("2")) draw_text(576, 640,"2");
if keyboard_check(ord("3")) draw_text(672, 640,"3");
if keyboard_check(ord("4")) draw_text(768, 640,"4");
*/

if gamepause==1{
	draw_set_colour(c_black);
	draw_set_alpha(0.4);
	draw_rectangle(0,0,2222,2222,0);

	draw_set_colour(c_white);
	draw_set_alpha(1);
	
	if(global.mirror!=1){
		draw_text_transformed(640, 160, "暂停",1,1,0);
		draw_text_transformed(640, 290, "Enter: 继续",0.4,0.4,0);
		draw_text_transformed(640, 350, "ESC: 退出",0.4,0.4,0);
		draw_text_transformed(640, 410, "R: 重玩",0.4,0.4,0);
	}
	else{
		draw_text_transformed(640, 160, "暂停",-1,1,0);
		draw_text_transformed(640, 290, "Enter: 继续",-0.4,0.4,0);
		draw_text_transformed(640, 350, "ESC: 退出",-0.4,0.4,0);
		draw_text_transformed(640, 410, "R: 重玩",-0.4,0.4,0);
	}
}
draw_set_colour(c_white);
draw_set_alpha(1);