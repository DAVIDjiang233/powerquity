function scr_draw_text(_x,_y,_string,_xscale,_yscale,_angle){
	draw_text_transformed(_x,_y,_string,_xscale*72/global.fontsize,_yscale*72/global.fontsize,_angle);
}