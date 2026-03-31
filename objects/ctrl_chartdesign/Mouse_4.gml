if (global.mouseonbtn==1) exit;

if (designview==0){
	if (!keyboard_check(vk_shift)){
		var _mousekey=scr_getmousenote(1);
		if (!keyboard_check(vk_control)){
			global.choose=[];
		}
		if (_mousekey!=-1){
			var _choose=array_get_index(global.choose, _mousekey);
			if _choose==-1{
				array_push(global.choose,_mousekey);
				array_sort(global.choose,function(elm1, elm2){
					return real(elm1)-real(elm2);
				});
			}
			else array_delete(global.choose,_choose,1);
		}
	}
	else if (square_y==-1){
			
		square_x=(mouse_x-257)/102;
		square_y=global.mousetime;
			
	}
	else if(square_y!=-1){
		var _y1=global.mousetime,
			_y2,
			_x1=(mouse_x-257)/102,
			_x2;
		
		if (square_y<_y1){
			_y2=_y1;
			_y1=square_y;
		}
		else _y2=square_y;
		
		if (square_x<_x1){
			_x2=_x1;
			_x1=square_x;
		}
		else _x2=square_x;
		
		for(var i=0;i<array_length(global.chartread);i++){
			var _y=real(global.chartread[i][1]);
			var _notex=0;
			if(global.chartread[i][0]=="RT"||global.chartread[i][0]=="RM"||global.chartread[i][0]=="RA"){
				_notex=global.chartread[i][4+floor(global.rand[real(global.chartread[i][2])]*(array_length(global.chartread[i])-4))]
				if (_notex=="none"){_notex=0;}
			}
			else if(global.chartread[i][0]=="RF"){
				_notex=global.chartread[i][5+floor(global.rand[real(global.chartread[i][2])]*(array_length(global.chartread[i])-5))];
				if (_notex=="none"){_notex=0;}
			}
			else if(global.chartread[i][0]=="BP"){
				_notex=real(global.chartread[i][2])+0.5;
			}
			else if(global.chartread[i][0]=="TP"){
				_notex=real(global.chartread[i][2])+1;
			}
			else if(global.chartread[i][0]=="QP"){
				_notex=real(global.chartread[i][2])+1.5;
			}
			else{
				_notex=global.chartread[i][2];
			}
			
		
			if (_y1<=_y&&_y2>=_y){
				if (array_get_index(global.choose, i)==-1
				&& (timinggroup<0||real(global.chartread[i][3])==timinggroup)
				&& (real(_notex)>=_x1&&real(_notex)<=_x2)){
					array_push(global.choose,i);
				}
			}
		}
		array_sort(global.choose,function(elm1, elm2){
			return real(elm1)-real(elm2);
		});
		
		square_y=-1;
	}
}
else if (designview==1){
	if (!keyboard_check(vk_shift)){
		var _mousekey=scr_getmousesvex(timinggroup,1);
		if (!keyboard_check(vk_control)){
			global.svchoose=[[],[],[],[],[],[],[],[],[],[]];
		}
		if (_mousekey[0]!=-1){
			var _choose=array_get_index(global.svchoose[_mousekey[0]], _mousekey[1]);
			if _choose==-1{
				array_push(global.svchoose[_mousekey[0]],_mousekey[1]);
				array_sort(global.svchoose[_mousekey[0]],function(elm1, elm2){
					return real(elm1)-real(elm2);
				});
			}
			else array_delete(global.svchoose[_mousekey[0]],_choose,1);
		}
		//show_debug_message(global.svchoose);
	}
	else if (square_y==-1){
			
		square_x=(mouse_x-257)/102;
		square_y=global.mousetime;
			
	}
	else if(square_y!=-1){
		var _y1=global.mousetime,
			_y2,
			_x1=(mouse_x-257)/102,
			_x2;
		
		if (square_y<_y1){
			_y2=_y1;
			_y1=square_y;
		}
		else _y2=square_y;
		
		if (square_x<_x1){
			_x2=_x1;
			_x1=square_x;
		}
		else _x2=square_x;
		if(timinggroup>=0){
			for(var j=0;j<=4;j++){
				for(var i=0;i<array_length(global.svchange[j][timinggroup]);i++){
					var _y=real(global.svchange[j][timinggroup][i][0]);
		
					if (_y1<=_y&&_y2>=_y){
						if (array_get_index(global.svchoose[j], i)==-1
						&& (j>=_x1&&j<=_x2)){
							array_push(global.svchoose[j],i);
						}
					}
				}
				array_sort(global.svchoose[j],function(elm1, elm2){
					return real(elm1)-real(elm2);
				});
			}
			for(var j=5;j<=8;j++){
				for(var i=0;i<array_length(global.svchange[j][timinggroup]);i++){
					var _y=real(global.svchange[j][timinggroup][i][0]);
		
					if (_y1<=_y&&_y2>=_y){
						if (array_get_index(global.svchoose[j], i)==-1
						&& (j-4>=_x1&&j-4<=_x2)){
							array_push(global.svchoose[j],i);
						}
					}
				}
				array_sort(global.svchoose[j],function(elm1, elm2){
					return real(elm1)-real(elm2);
				});
			}
		}
		
		square_y=-1;
	}
}
else if (designview==-1){
	if (!keyboard_check(vk_shift)){
		var _mousekey=scr_getmouserandom(1);
		if (!keyboard_check(vk_control)){
			global.choose=[];
		}
		if (_mousekey!=-1){
			var _choose=array_get_index(global.choose, _mousekey);
			if _choose==-1{
				array_push(global.choose,_mousekey);
				array_sort(global.choose,function(elm1, elm2){
					return real(elm1)-real(elm2);
				});
			}
			else array_delete(global.choose,_choose,1);
		}
	}
	else if (square_y==-1){
			
		square_x=(mouse_x-257)/102;
		square_y=global.mousetime;
			
	}
	else if(square_y!=-1){
		var _y1=global.mousetime,
			_y2,
			_x1=(mouse_x-359)/102,
			_x2;
		
		if (square_y<_y1){
			_y2=_y1;
			_y1=square_y;
		}
		else _y2=square_y;
		
		if (square_x-1<_x1){
			_x2=_x1;
			_x1=square_x-1;
		}
		else _x2=square_x-1;
		
		
		for(var i=0;i<array_length(global.chartread);i++){
			
			if(global.chartread[i][0]=="RT"||global.chartread[i][0]=="RA"||global.chartread[i][0]=="RF"||global.chartread[i][0]=="RM"){
				var _y=real(global.chartread[i][1]);
				var _notex=global.chartread[i][2];
			
		
				if (_y1<=_y&&_y2>=_y){
					if (array_get_index(global.choose, i)==-1
					&& (timinggroup<0||real(global.chartread[i][3])==timinggroup)
					&& (real(_notex)>=_x1&&real(_notex)<=_x2)){
						array_push(global.choose,i);
					}
				}
			}
		}
		array_sort(global.choose,function(elm1, elm2){
			return real(elm1)-real(elm2);
		});
		
		square_y=-1;
	}
}
else if (designview==-2){
	if(array_length(global.choose)!=0){
		var _q=global.choose[0];
		global.choose=[];
		for(var i=_q-1;i>=0;i--){
			var _y=608+(global.playtime-real(global.bpmlist[i][0]))*global.globalspeed*0.25;
			if (_y<mouse_y+30&&mouse_y-10<_y){
				global.choose=[i];
				break;
			}
		}
	}
	if(array_length(global.choose)==0){
		for(var i=array_length(global.bpmlist)-1;i>=0;i--){
			var _y=608+(global.playtime-real(global.bpmlist[i][0]))*global.globalspeed*0.25;
			if (_y<mouse_y+30&&mouse_y-10<_y){
				global.choose=[i];
				break;
			}
		}
	}
	show_debug_message(global.choose);
}