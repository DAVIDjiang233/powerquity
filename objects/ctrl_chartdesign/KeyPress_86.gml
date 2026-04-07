if (global.mouseonbtn==1) exit;
if !keyboard_check(vk_control) exit;
if array_length(global.copy)==0 exit;


if (designview==0||designview==-1){
	if (global.mousetime<0) exit;
	var _time=scr_barfind(global.barlist,global.mousetime);
	global.choose=[];
	_time=_time-real(global.copy[0][1]);

	for(var i=array_length(global.copy)-1;i>=0;i--){
	
		global.chartread[array_length(global.chartread)]=[];
		array_copy(global.chartread[array_length(global.chartread)-1], 0, global.copy[i], 0, array_length(global.copy[i]));
		global.chartread[array_length(global.chartread)-1][1]=_time+real(global.chartread[array_length(global.chartread)-1][1]);
		if (global.copy[i][0]=="L"||global.copy[i][0]=="LN"){
			global.chartread[array_length(global.chartread)-1][4]=_time+real(global.chartread[array_length(global.chartread)-1][4]);
		}
		if(timinggroup>=0){
			global.chartread[array_length(global.chartread)-1][3]=timinggroup;
		}
	}

	array_sort(global.chartread,function(elm1, elm2){
		if real(elm1[1])>real(elm2[1]) return 1;
		else if real(elm1[1])<real(elm2[1]) return -1;
		else if elm1[0]="L" return 1;
		else return -1;
	});
	scr_cancelchart();
	scr_listchange(1);
}

if (designview==1){
	if (global.mousetime<0) exit;
	var _time=scr_barfind(global.barlist,global.mousetime);
	
	if (timinggroup>=0){
		global.choose=[];
		var _timec="none";
		for(var j=0;j<9;j++){
			if(array_length(global.copy[j])!=0){
				if(_timec=="none"||_timec>real(global.copy[j][0][0]))
				_timec=real(global.copy[j][0][0]);
			}
		}
		if (_timec="none") exit;
		_time-=_timec;
		
		for(var j=0;j<9;j++){
			for(var i=array_length(global.copy[j])-1;i>=0;i--){
	
				global.svchange[j][timinggroup][array_length(global.svchange[j][timinggroup])]=[];
				array_copy(global.svchange[j][timinggroup][array_length(global.svchange[j][timinggroup])-1], 0, global.copy[j][i], 0, array_length(global.copy[j][i]));
				global.svchange[j][timinggroup][array_length(global.svchange[j][timinggroup])-1][0]=_time+real(global.svchange[j][timinggroup][array_length(global.svchange[j][timinggroup])-1][0]);

			}
			array_sort(global.svchange[j][timinggroup],function(elm1, elm2){
				return real(elm1[0])-real(elm2[0]);
			});
		}
		scr_cancelsv();
	}
}