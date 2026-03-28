if (global.mouseonbtn==1) exit;

if (designview==0){
	var _mousekey=scr_getmousenote(0);
	if (_mousekey!=-1){
		array_delete(global.chartread,_mousekey,1);
		scr_cancelchart();
		scr_listchange(-1);
		
	}
	global.choose=[];
}
else if (designview==1){
	global.svchoose=[[],[],[],[],[],[],[],[],[],[]];
	var _mousekey=scr_getmousesvex(timinggroup,0);
	if(_mousekey[0]!=-1){
		global.svchoose[_mousekey[0]]=[_mousekey[1]];
		scr_svdeleat(timinggroup);
		scr_cancelsv();
	}
}
else if (designview==-1){
	var _mousekey=scr_getmouserandom(0);
	if (_mousekey!=-1){
		array_delete(global.chartread,_mousekey,1);
		scr_cancelchart();
		scr_listchange(-1);
		
	}
	global.choose=[];
}