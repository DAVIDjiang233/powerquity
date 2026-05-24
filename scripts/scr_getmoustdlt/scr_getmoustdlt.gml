function scr_getmoustdlt(){
	for(var _i=1;_i<=8;_i++){
		if (mouse_x<=global.skinnumber[2*_i+32]+24&&mouse_x>=global.skinnumber[2*_i+32]-24
		&&mouse_y<=global.skinnumber[2*_i+33]+24&&mouse_y>=global.skinnumber[2*_i+33]-24
		){
			return _i;
		}
	}
	return 0;
}