function xset(_key,_time,_x=640){
	_x+=(global.chartxmove[timinggroup]/102+_key-2.5)*global.skinnumber[1];
	return _x;
}