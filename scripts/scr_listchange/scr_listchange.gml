function scr_listchange(type){
	var _endtime=global.playtime+5000;
	
	while(global.list>=0&&global.list<array_length(global.chartread)
	&&real(global.chartread[global.list][1])*type<_endtime*type
	){
		global.list+=type;
	}
	
	while (global.list<0){global.list++;}
	while (global.list>=array_length(global.chartread)){global.list--;}
}