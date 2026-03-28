if (global.mouseonbtn==1) exit;


if (designview==0){
	if array_length(global.choose)==0 exit;
	for(var i=0;i<array_length(global.choose);i++){
		if(global.chartread[global.choose[i]][0]=="RT"||global.chartread[global.choose[i]][0]=="RM"||global.chartread[global.choose[i]][0]=="RA"){
			if(global.chartread[global.choose[i]][4+floor(global.rand[real(global.chartread[global.choose[i]][2])]*(array_length(global.chartread[global.choose[i]])-4))]!="none"){
				global.chartread[global.choose[i]][4+floor(global.rand[real(global.chartread[global.choose[i]][2])]*(array_length(global.chartread[global.choose[i]])-4))]=5-real(global.chartread[global.choose[i]][4+floor(global.rand[real(global.chartread[global.choose[i]][2])]*(array_length(global.chartread[global.choose[i]])-4))]);
			}
		}
		else if(global.chartread[global.choose[i]][0]=="RF"){
			if(global.chartread[global.choose[i]][5+floor(global.rand[real(global.chartread[global.choose[i]][2])]*(array_length(global.chartread[global.choose[i]])-5))]!="none"){
				global.chartread[global.choose[i]][5+floor(global.rand[real(global.chartread[global.choose[i]][2])]*(array_length(global.chartread[global.choose[i]])-5))]=5-real(global.chartread[global.choose[i]][5+floor(global.rand[real(global.chartread[global.choose[i]][2])]*(array_length(global.chartread[global.choose[i]])-5))]);
			}
		}
		else if(global.chartread[global.choose[i]][0]=="BP"){
			global.chartread[global.choose[i]][2]=4-real(global.chartread[global.choose[i]][2]);
		}
		else if(global.chartread[global.choose[i]][0]=="TP"){
			global.chartread[global.choose[i]][2]=3-real(global.chartread[global.choose[i]][2]);
		}
		else if(global.chartread[global.choose[i]][0]=="QP"){
			global.chartread[global.choose[i]][2]=2-real(global.chartread[global.choose[i]][2]);
		}
		else{
			global.chartread[global.choose[i]][2]=5-real(global.chartread[global.choose[i]][2]);
		}
	}
	scr_cancelchart();
}
/*else if (designview==1){
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
				show_debug_message(global.svchange[j][timinggroup][global.svchoose[j][i]])
				array_copy(global.copy[j][array_length(global.copy[j])-1], 0, global.svchange[j][timinggroup][global.svchoose[j][i]], 0, array_length(global.svchange[j][timinggroup][global.svchoose[j][i]]));
			}
		}
		//show_debug_message(global.copy);
		scr_svdeleat(timinggroup);
		scr_cancelsv();
		global.svchoose=[[],[],[],[],[],[],[],[],[],[]];
	}
}*/