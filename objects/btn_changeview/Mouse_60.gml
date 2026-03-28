if(mouseonbtn==0) exit;
if(ctrl_chartdesign.designview==viewmax) exit;
ctrl_chartdesign.square_y=-1;
ctrl_chartdesign.designview+=1;
ctrl_chartdesign.holdinput=-1;
ctrl_chartdesign.help=0;
for(var i=0;i<array_length(global.svchange[4]);i++){
	if(array_length(global.svchange[8])<=i){global.svchange[8][i]=[]}
	global.chartxmove[i]=scr_svset(global.svchange[4][i],global.svchange[8][i],global.playtime);
}
for(var i=0;i<array_length(global.svchange[1]);i++){
	if(array_length(global.svchange[5])<=i){global.svchange[5][i]=[]}
	global.chartspeed[i]=scr_svset(global.svchange[1][i],global.svchange[5][i],global.playtime);
}
for(var i=0;i<array_length(global.svchange[2]);i++){
	if(array_length(global.svchange[6])<=i){global.svchange[6][i]=[]}
	global.chartmoveinspeed[i]=scr_svset(global.svchange[2][i],global.svchange[6][i],global.playtime);
}
for(var i=0;i<array_length(global.svchange[3]);i++){
	if(array_length(global.svchange[7])<=i){global.svchange[7][i]=[]}
	global.chartmoveinglobal[i]=scr_svset(global.svchange[3][i],global.svchange[7][i],global.playtime);
}
global.copy=[];
global.choose=[];
global.svchoose=[[],[],[],[],[],[],[],[],[],[]];