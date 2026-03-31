if (designview<=0&&designview>=-1){
	array_sort(global.choose,function(elm1, elm2){
		return real(elm1)-real(elm2);
	});
	
	var _q=array_length(global.choose);
	while(_q>0){
		_q--;
		/*
		show_debug_message(global.choose[_q]);
		show_debug_message(array_length(global.chartread));
		show_debug_message(global.chartread[global.choose[_q]]);
		*/
		array_delete(global.chartread,global.choose[_q],1);
	}
	scr_cancelchart();
	scr_listchange(-1);
	global.choose=[];
}
else if (designview==1){
	scr_svdeleat(timinggroup);
	scr_cancelsv();
	global.svchoose=[[],[],[],[],[],[],[],[],[],[]];
}
else if (designview==-2){
	array_delete(global.bpmlist,global.choose[0],1);
	global.choose=[];
}