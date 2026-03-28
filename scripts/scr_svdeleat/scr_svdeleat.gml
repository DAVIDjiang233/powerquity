function scr_svdeleat(_tg){
	for(var j=0;j<9;j++){
		var i=array_length(global.svchoose[j]);
		while(i>0){
			i--;
			array_delete(global.svchange[j][_tg],global.svchoose[j][i],1);
		}
	}
	global.svchoose=[[],[],[],[],[],[],[],[],[],[]];
}