draw_set_halign(fa_left);
scr_set_font(global.fontall[0]);
draw_set_colour(c_white);
draw_set_alpha(1);


var _fps="FPS: "+string_format(fps,0,0)

if debug_mode{
	scr_draw_text(192, 300, string(global.playtime),0.2,0.2,0);
	scr_draw_text(888, 616, "keylist"+string(global.keylist),0.2,0.2,0);
	scr_draw_text(888, 676, "keytouchlist"+string(global.keytouchlist),0.2,0.2,0);
	//scr_draw_text(888, 676, string(global.chartmoveinspeed[0]),0.2,0.2,0);
	
	
	for(var _i=0;_i<4;_i++){
		for(var _j=0;_j<array_length(autopress[_i]);_j++){
			var _time=(global.playtime-autopress[_i][_j][1])*global.globalspeed/7+608;
			if(autopress[_i][_j][0]=="N") draw_set_colour(c_lime);
			else if(autopress[_i][_j][0]=="M") draw_set_colour(#ffaa00);
			else draw_set_colour(c_aqua);
			draw_line_width((_i*50)+850,_time,(_i*50)+900,_time,5);
			scr_draw_text((_i*50)+875, _time,_j,0.3,0.3,0);
		}
	}
	for(var _i=0;_i<4;_i++){
		for(var _j=0;_j<array_length(autopress2[_i]);_j++){
			if(autopress2[_i][_j][0]=="A") {
				var _time=(global.playtime-autopress2[_i][_j][1])*global.globalspeed/7+608;
				draw_set_colour(c_yellow);
				draw_line_width((_i*50)+850,_time,(_i*50)+900,_time,5);
				scr_draw_text((_i*50)+875, _time,_j,0.3,0.3,0);
			}
		}
	}
	draw_set_colour(c_red);
	for(var _i=0;_i<4;_i++){
		for(var _j=0;_j<array_length(autorelease[_i]);_j++){
			var _time=(global.playtime-autorelease[_i][_j])*global.globalspeed/7+608;
			draw_line_width((_i*50)+850,_time,(_i*50)+900,_time,5);
			scr_draw_text((_i*50)+875, _time,_j,0.3,0.3,0);
		}
	}
	draw_set_colour(c_white);
}

draw_set_halign(fa_center);

if (alarmpause>current_time){
	scr_draw_text(640, 288,(alarmpause-current_time)/1000,0.6*(0.5-global.mirror),0.3,0);
}

draw_set_colour(c_white);
draw_set_alpha(1);