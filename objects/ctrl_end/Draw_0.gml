draw_set_halign(fa_center);
draw_set_valign(fa_middle);
scr_set_font(global.fontall[0]);

if(color==200){
	draw_set_colour(c_aqua);
}
else if(color==600){
	draw_set_colour(c_yellow);
}
else if(color==400){
	draw_set_colour(c_lime);
}
else draw_set_colour(c_white);
scr_draw_text(300, 200, result,1,1,0);
draw_set_colour(c_white);
scr_draw_text(832, 100, string_format(acc,0,3)+"%",0.6,0.6,0);
if(global.autoplay==0){
	scr_draw_text(832, 180, "最高ACC: "+string_format(oldhighscore,0,3)+"%",0.3,0.3,0);
}
else{
	draw_set_colour(c_yellow);
	scr_draw_text(832, 180, "Auto Play",0.3,0.3,0);
}

if global.scored==0 {
	draw_set_colour(c_yellow);
	scr_draw_text(832, 230, "(不计入成绩)",0.3,0.3,0);
	
}
else{
	if(real(oldhighscore)>real(acc)) scr_draw_text(832, 230, string_format(acc-oldhighscore,0,3)+"%",0.3,0.3,0);
	else scr_draw_text(832, 230, "+"+string_format(acc-oldhighscore,0,3)+"%",0.3,0.3,0);
}

draw_set_valign(fa_top);
var _mods="  ";
if global.gamespeed!=1{
	_mods="谱面倍速"+string(global.gamespeed)+"×  ";
}
if global.judgesize!=1{
	_mods=_mods+"判定范围"+string(global.judgesize)+"×  ";
}
if (_mods!="  ") _mods=_mods+"\n  "
if global.svenable!=1{
	_mods=_mods+"无变速  ";
}
if global.mirror==1{
	_mods=_mods+"镜像  ";
}
scr_draw_text(832, 260, _mods,0.25,0.25,0);
draw_set_valign(fa_middle);
draw_set_colour(c_white);

scr_draw_text(832, 350, "Perfect:"+string(global.textlist[10]),0.5,0.5,0);
scr_draw_text(832, 430, "Great:"+string(global.textlist[11]),0.5,0.5,0);
scr_draw_text(832, 510, "Good:"+string(global.textlist[12]),0.5,0.5,0);

if(global.textlist[13]==0){
	var _qq="",_qw="";
	if(global.maxel[0]>=0) _qq="+"
	if(global.maxel[1]>=0) _qw="+"
	scr_draw_text(832, 590, "Early:"+_qq+string(global.maxel[0]/global.gamespeed)+"ms    Late:"+_qw+string(global.maxel[1]/global.gamespeed)+"ms",0.4,0.4,0);
}
else scr_draw_text(832, 590, "Miss:"+string(global.textlist[13]),0.5,0.5,0);


if global.timingcnt>=0
scr_draw_text(832, 670, "平均打击延迟: +"+string(global.timingcnt/(global.tapcnt*global.gamespeed))+"ms",0.3,0.3,0);
else
scr_draw_text(832, 670, "平均打击延迟: "+string(global.timingcnt/(global.tapcnt*global.gamespeed))+"ms",0.3,0.3,0);

scr_draw_text(300, 380, string(global.fileread[0]),0.5,0.5,0,550);
scr_draw_text(300, 440, string(global.fileread[1]),0.4,0.4,0,500);


//scr_draw_text(300, 520, "谱面id: "+string(global.level),0.3,0.3,0);

if (global.playtype==1) scr_draw_text(300, 520, "游玩类型: Mania",0.3,0.3,0);
else if (global.playtype==2) scr_draw_text(300, 520, "游玩类型: QWERTYUIOP!!",0.3,0.3,0);

scr_draw_text(300, 580, "难度: "+string(global.fileread[global.level*2+4]),0.3,0.3,0);
scr_draw_text(300, 640, "谱师: "+string(global.fileread[global.level*2+3]),0.3,0.3,0);