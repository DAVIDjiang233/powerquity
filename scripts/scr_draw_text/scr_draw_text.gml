function scr_draw_text(_x,_y,_string,_xscale,_yscale,_angle,maxsize=-1){
	var _size=1;
	if(global.fontsize!=-1) _size=72/global.fontsize;
	if(maxsize>0){
		var _w=string_width(_string);
		if(_w*_xscale*_size>maxsize){
			_size=maxsize/(_xscale*_w);
		}
	}
	draw_text_transformed(_x,_y,_string,_xscale*_size,_yscale*_size,_angle);
}