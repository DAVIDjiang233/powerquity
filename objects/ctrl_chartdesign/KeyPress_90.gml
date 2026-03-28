
if (global.mouseonbtn==1) exit;
if !keyboard_check(vk_control) exit;

if (designview<=0){
	if(cancelchartlist<=0) exit;
	cancelchartlist--;
	
	global.choose=[];
	global.chartread=[];

	for (var i=0;i<array_length(global.cancelchart[cancelchartlist]);i++){
		global.chartread[i]=[];
		array_copy(global.chartread[i], 0,global.cancelchart[cancelchartlist][i], 0, array_length(global.cancelchart[cancelchartlist][i]));
	}
	global.list=0;
	scr_listchange(1);
	
}
if (designview==1){
	if(cancelsvlist<=0) exit;
	cancelsvlist--;
	
	global.svchoose=[[],[],[],[],[],[],[],[],[],[]];
	global.svchange=[[],[],[],[],[],[],[],[],[],[]];

	//array_copy(global.svchange, 0,global.cancelsv[cancelsvlist], 0, array_length(global.cancelsv[cancelsvlist]));
	for(var i=0;i<=8;i++){
		for(var j=0;j<=timinggroup;j++){
			global.svchange[i][j]=[];
		}
		
		for(var j=0;j<array_length(global.cancelsv[cancelsvlist][i]);j++){
			global.svchange[i][j]=[];
			for (var k=0;k<array_length(global.cancelsv[cancelsvlist][i][j]);k++){
				global.svchange[i][j][k]=[];
				array_copy(global.svchange[i][j][k], 0, global.cancelsv[cancelsvlist][i][j][k], 0, array_length(global.cancelsv[cancelsvlist][i][j][k]));
			}
		}
	}
	for (var i=0;i<array_length(global.cancelsv[cancelsvlist][9]);i++){
		global.svchange[9][i]=[];
		array_copy(global.svchange[9][i], 0,global.cancelsv[cancelsvlist][9][i], 0, array_length(global.cancelsv[cancelsvlist][9][i]));
	}
}
