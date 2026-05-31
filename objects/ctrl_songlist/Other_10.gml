if playtypemod!=0 global.scored=0;
else if global.svenable==0 global.scored=0;
else if global.gamespeed!=1 global.scored=0;
else if global.judgesize!=1 global.scored=0;
else if global.autoplay!=0 global.scored=0;
else global.scored=1;
moding=0;


if(global.scored==1){
	global.textlist[48]="";
	global.textlist[49]="";
	global.textlist[50]="";
	global.textlist[51]="";
	global.textlist[52]="";
}

if global.autoplay==1{
	global.textlist[48]="  自动判定";
}
else if global.autoplay==2{
	global.textlist[48]="  模拟按键";
}

if global.mirror==1{
	global.textlist[49]="  镜像";
}
if global.gamespeed!=1{
	global.textlist[50]="  谱面倍速"+string(global.gamespeed)+"×";
}
if global.judgesize!=1{
	global.textlist[51]="  判定范围"+string(global.judgesize)+"×";
}
if global.svenable!=1{
	global.textlist[52]="  无变速";
}

