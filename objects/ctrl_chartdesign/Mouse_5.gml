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
else if (designview==-2){
	if(array_length(global.bpmlist)==1)exit;
	if (mouse_x<700&&mouse_x>500){
		global.choose=[];
		for(var i=array_length(global.bpmlist)-1;i>0;i--){

			var _y=608+(global.playtime-real(global.bpmlist[i][0]))*global.globalspeed*0.25;
				
			if (_y<mouse_y+30&&mouse_y-10<_y){
				array_delete(global.bpmlist,i,1);
				global.barlist=scr_barline(global.bpmlist, global.playtime, global.playtime+5000);
				break;
			}
		}
	}
}