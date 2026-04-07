if (global.mouseonbtn==1) exit;
if !keyboard_check(vk_control) exit;


if (designview==0||designview==-1){
	if array_length(global.choose)==0 exit;
	global.copy=[];
	for(var i=0;i<array_length(global.choose);i++){
		global.copy[array_length(global.copy)]=[];
		array_copy(global.copy[array_length(global.copy)-1], 0, global.chartread[global.choose[i]], 0, array_length(global.chartread[global.choose[i]]));
	}
	var _q=array_length(global.choose);
	while(_q>0){
		_q--;
		array_delete(global.chartread,global.choose[_q],1);
	}
	scr_cancelchart();
	scr_listchange(-1);
	global.choose=[];
}
else if (designview==1){
	if (array_length(global.svchoose[0])
	+array_length(global.svchoose[1])
	+array_length(global.svchoose[2])
	+array_length(global.svchoose[3])
	+array_length(global.svchoose[4])
	+array_length(global.svchoose[5])
	+array_length(global.svchoose[6])
	+array_length(global.svchoose[7])
	+array_length(global.svchoose[8])
	+array_length(global.svchoose[9])==0) exit;
	global.copy=[[],[],[],[],[],[],[],[],[],[]];
	if(timinggroup>=0){
		for(var j=0;j<9;j++){
			for(var i=0;i<array_length(global.svchoose[j]);i++){
				global.copy[j][array_length(global.copy[j])]=[];
				//show_debug_message(global.svchange[j][timinggroup][global.svchoose[j][i]])
				array_copy(global.copy[j][array_length(global.copy[j])-1], 0, global.svchange[j][timinggroup][global.svchoose[j][i]], 0, array_length(global.svchange[j][timinggroup][global.svchoose[j][i]]));
			}
		}
		//show_debug_message(global.copy);
		scr_svdeleat(timinggroup);
		scr_cancelsv();
		global.svchoose=[[],[],[],[],[],[],[],[],[],[]];
	}
}