function scr_cancelchart(){

	var _all=[];
	ctrl_chartdesign.cancelchartlist++;
	for (var i=0;i<array_length(global.chartread);i++){
		_all[i]=[];
		array_copy(_all[i], 0, global.chartread[i], 0, array_length(global.chartread[i]));
	}
	global.cancelchart[ctrl_chartdesign.cancelchartlist]=_all;
	
	while(ctrl_chartdesign.cancelchartlist+1<array_length(global.cancelchart)){
		array_delete(global.cancelchart,ctrl_chartdesign.cancelchartlist+1,1);
	}
	
	if (array_length(global.cancelchart)>50){
		array_delete(global.cancelchart,0,1);
		ctrl_chartdesign.cancelchartlist--;
	}
}