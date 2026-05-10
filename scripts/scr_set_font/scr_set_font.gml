function scr_set_font(_font){
	draw_set_font(_font);
	if(string_starts_with(font_get_fontname(_font),"__")){
		global.fontsize=-1;
	}
	else{
		global.fontsize=font_get_size(_font);
	}
}