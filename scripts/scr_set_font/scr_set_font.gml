function scr_set_font(_font){
	draw_set_font(_font);
	global.fontsize=font_get_size(_font);
}