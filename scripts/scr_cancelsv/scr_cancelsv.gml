function scr_cancelsv(){
	var _all=[[],[],[],[],[],[],[],[],[],[]];
	ctrl_chartdesign.cancelsvlist++;
	for(var i=0;i<=8;i++){
		for(var j=0;j<array_length(global.svchange[i]);j++){
			for (var k=0;k<array_length(global.svchange[i][j]);k++){
				_all[i][j][k]=[];
				array_copy(_all[i][j][k], 0, global.svchange[i][j][k], 0, array_length(global.svchange[i][j][k]));
			}
		}
	}
	for (var k=0;k<array_length(global.svchange[9]);k++){
		_all[9][k]=[];
		array_copy(_all[9][k], 0, global.svchange[9][k], 0, array_length(global.svchange[9][k]));
	}
	global.cancelsv[ctrl_chartdesign.cancelsvlist]=_all;
	
	while(ctrl_chartdesign.cancelsvlist+1<array_length(global.cancelsv)){
		array_delete(global.cancelsv,ctrl_chartdesign.cancelsvlist+1,1);
	}
	
	if (array_length(global.cancelsv)>50){
		array_delete(global.cancelsv,0,1);
		ctrl_chartdesign.cancelsvlist--;
	}
}