if playtypemod!=0 global.scored=0;
else if global.svenable==0 global.scored=0;
else if global.gamespeed!=1 global.scored=0;
else if global.judgesize!=1 global.scored=0;
else if global.autoplay!=0 global.scored=0;
else global.scored=1;
moding=0;


if(global.scored==1){
	global.textlist[39]="";
}
else{
	global.textlist[39]=""
	var _mods="";
	if global.gamespeed!=1{
		_mods="谱面倍速"+string(global.gamespeed)+"×  ";
	}
	if global.judgesize!=1{
		_mods=_mods+"判定范围"+string(global.judgesize)+"×  ";
	}
	if (_mods!=""){
		_mods=_mods+"\n  "
		global.textlist[39]=global.textlist[39]+"\n"
	}
	if global.svenable!=1{
		_mods=_mods+"无变速  ";
	}
	if (_mods=="") _mods="  ";
	global.textlist[39]=global.textlist[39]+_mods;
}
if global.mirror==1{
	global.textlist[40]="镜像  ";
}
else global.textlist[40]="";
if global.autoplay==0{
	global.textlist[41]="";
}
else if global.autoplay==1{
	global.textlist[41]="自动判定";
}
else if global.autoplay==2{
	global.textlist[41]="模拟按键";
}

show_debug_message(global.textlist[39]+global.textlist[40])
