draw_set_valign(fa_middle);
draw_set_font(global.fontall);
draw_set_colour(c_white);
draw_set_halign(fa_right);
if(debug_mode) draw_text_transformed(1244, 700, "[DEBUG]",0.25,0.25,0);
else draw_text_transformed(1244, 700, "[63291]",0.25,0.25,0);
draw_set_halign(fa_center);
if array_length(global.filelist)==0 {
	draw_text_transformed(992, 160, "没有谱面 :(",0.5,0.5,0);
	draw_text_transformed(992, 218, "按R刷新",0.3,0.3,0);
	draw_text_transformed(992, 268, "按C导入谱面",0.3,0.3,0);
	draw_text_transformed(992, 318, "按V导入曲目创建谱面",0.3,0.3,0);
	exit;
}
draw_set_halign(fa_left);
draw_text_transformed(36, 700, "Z: 设置 / X: Mods / C: 导入谱面 / V: 编辑谱面",0.25,0.25,0);
draw_set_halign(fa_center);
if chartrue==1{
	
	if array_length(global.fileread)==0 exit;
	
	var _w=string_width(global.fileread[0]);
	if(_w>1100){
		draw_text_transformed(992, 160, string(global.fileread[0]),550/_w,550/_w,0);
	}
	else{
		draw_text_transformed(992, 160, string(global.fileread[0]),0.5,0.5,0);
	}
	_w=string_width(global.fileread[1]);
	if(_w>1250){
		draw_text_transformed(992, 218, string(global.fileread[1]),500/_w,500/_w,0);
	}
	else{
		draw_text_transformed(992, 218, string(global.fileread[1]),0.4,0.4,0);
	}
	
	draw_text_transformed(992, 398, "BPM: "+string(global.fileread[2]),0.3,0.3,0);
	draw_text_transformed(992, 458, "谱面id: "+string(global.level),0.3,0.3,0);

	if global.level!=0 draw_triangle(882,458,897,443,897,473,false);
	if global.level*2!=array_length(global.fileread)-5 draw_triangle(1102,458,1087,443,1087,473,false);

	draw_text_transformed(992, 518, "难度: "+string(global.fileread[global.level*2+4]),0.3,0.3,0);
	draw_text_transformed(992, 578, "谱师: "+string(global.fileread[global.level*2+3]),0.3,0.3,0);
	if playtypemod==0{
		if global.playtype==1 draw_text_transformed(992, 638, "游玩类型: Mania",0.3,0.3,0);
		if global.playtype==2 draw_text_transformed(992, 638, "游玩类型: QWERTYUIOP!!",0.3,0.3,0);
	}
	else{
		draw_set_colour(c_yellow);
		if playtypemod==1 draw_text_transformed(992, 638, "游玩类型: Mania",0.3,0.3,0);
		if playtypemod==2 draw_text_transformed(992, 638, "游玩类型: QWERTYUIOP!!",0.3,0.3,0);
		draw_set_colour(c_white);
	}
	if(global.highscore[global.level]>=600){
		draw_set_colour(c_yellow);
	}
	else if(global.highscore[global.level]>=400){
		draw_set_colour(c_lime);
	}
	else if(global.highscore[global.level]>=200){
		draw_set_colour(c_aqua);
	}
	else draw_set_colour(c_white);
	draw_text_transformed(992, 328, "最高分: "+string_format(global.highscore[global.level]%200,0,3)+"%",0.3,0.3,0);
}
else {
	draw_set_colour(c_red);
	draw_text_transformed(992, 160, "文件不完整",0.5,0.5,0);
}
draw_set_colour(c_white);
if global.scored==0{
	draw_set_colour(c_yellow);
	draw_text_transformed(992, 700, "(不计入成绩)",0.25,0.25,0);
	draw_set_colour(c_white);
}

if moding==1{
	draw_rectangle(0,288,768,736,0);
	draw_set_colour(c_black);
	draw_rectangle(6,294,762,730,0);
	draw_set_colour(c_white);
	draw_set_halign(fa_left);
	draw_triangle(50,340+50*modtype,35,350+50*modtype,35,330+50*modtype,false);
	if playtypemod==0{ draw_text_transformed(80, 340, "游玩类型: 默认",0.3,0.3,0);}
	else{
		draw_set_colour(c_yellow);
		if playtypemod==1 draw_text_transformed(80, 340, "游玩类型: Mania",0.3,0.3,0);
		if playtypemod==2 draw_text_transformed(80, 340, "游玩类型: QWERTYUIOP!!",0.3,0.3,0);
		draw_set_colour(c_white);
	}
	if global.svenable==1{ draw_text_transformed(80, 390, "无变速: 关",0.3,0.3,0);}
	
	else{
		draw_set_colour(c_yellow);
		draw_text_transformed(80, 390, "无变速: 开",0.3,0.3,0);

		draw_set_colour(c_white);
	}

	if global.gamespeed==1{ draw_text_transformed(80, 440, "谱面倍速: 原速",0.3,0.3,0);}
	
	else{
		draw_set_colour(c_yellow);
		draw_text_transformed(80, 440, "谱面倍速: "+string(global.gamespeed)+"×",0.3,0.3,0);

		draw_set_colour(c_white);
	}
	
	if global.judgesize==1{ draw_text_transformed(80, 490, "判定范围: 1×",0.3,0.3,0);}
	
	else{
		draw_set_colour(c_yellow);
		draw_text_transformed(80, 490, "判定范围: "+string(global.judgesize)+"×",0.3,0.3,0);

		draw_set_colour(c_white);
	}
	if global.mirror==1{ draw_text_transformed(80, 540, "镜像: 开",0.3,0.3,0);}
	
	else{
		draw_text_transformed(80, 540, "镜像: 关",0.3,0.3,0);
		draw_set_colour(c_white);
	}
	if global.autoplay==0{ draw_text_transformed(80, 590, "自动游玩: 关",0.3,0.3,0);}
	
	else{
		draw_set_colour(c_yellow);
		if global.autoplay==1{
			draw_text_transformed(80, 590, "自动游玩: 自动判定",0.3,0.3,0);
		}
		else draw_text_transformed(80, 590, "自动游玩: 模拟按键",0.3,0.3,0);
		draw_set_colour(c_white);
	}
}

else if chartloading==1{
	draw_rectangle(0,288,768,736,0);
	draw_set_colour(c_black);
	draw_rectangle(6,294,762,730,0);
	draw_set_colour(c_white);
	draw_set_halign(fa_left);
	if confirmt==1 {
		draw_set_colour(#ff4444);
		if modtype==1 {
			draw_text_transformed(80, 590, "你是否要删除该谱面的全部成绩:",0.3,0.3,0);
			draw_text_transformed(80, 630, global.filelist[global.chart],0.3,0.3,0);
			draw_text_transformed(80, 680, "Enter: 确认 / ESC: 取消",0.3,0.3,0);
		}
		if modtype==2 {
			draw_text_transformed(80, 590, "你是否要删除歌曲:",0.3,0.3,0);
			draw_text_transformed(80, 630, global.filelist[global.chart],0.3,0.3,0);
			draw_text_transformed(80, 680, "Enter: 确认 / ESC: 取消",0.3,0.3,0);
		}
		if modtype==3 {
			draw_text_transformed(80, 590, "是否向前移动该谱面:",0.3,0.3,0);
			draw_text_transformed(80, 630, "交换id为 "+string(global.level)+" 与id为 "+string(global.level-1)+" 的谱面",0.3,0.3,0);
			draw_text_transformed(80, 680, "Enter: 确认 / ESC: 取消",0.3,0.3,0);
		}
		if modtype==4 {
			draw_text_transformed(80, 590, "是否向后移动该谱面:",0.3,0.3,0);
			draw_text_transformed(80, 630, "交换id为 "+string(global.level)+" 与id为 "+string(global.level+1)+" 的谱面",0.3,0.3,0);
			draw_text_transformed(80, 680, "Enter: 确认 / ESC: 取消",0.3,0.3,0);
		}
		
	}
	else{
		draw_text_transformed(80, 590, "更改谱面标识名",0.3,0.3,0);
		draw_text_transformed(80, 640, "导出谱面",0.3,0.3,0);
	}
	draw_triangle(50,340+50*modtype,35,350+50*modtype,35,330+50*modtype,false);
	draw_set_colour(c_white);
	draw_text_transformed(80, 340, "导入谱面",0.3,0.3,0);
	draw_text_transformed(80, 390, "删除成绩",0.3,0.3,0);
	draw_text_transformed(80, 440, "删除歌曲",0.3,0.3,0);
	if(global.level==0){
		draw_set_colour(c_gray);
	}
	else{
		draw_set_colour(c_white);
	}
	draw_text_transformed(80, 490, "向前移动谱面",0.3,0.3,0);
	if(global.level*2==array_length(global.fileread)-5){
		draw_set_colour(c_gray);
	}
	else{
		draw_set_colour(c_white);
	}
	draw_text_transformed(80, 540, "向后移动谱面",0.3,0.3,0);
	draw_set_colour(c_white);
}

else if chartediting==1{
	draw_rectangle(0,288,768,736,0);
	draw_set_colour(c_black);
	draw_rectangle(6,294,762,730,0);
	draw_set_colour(c_white);
	draw_set_halign(fa_left);
	if confirmt==1 {
		draw_set_colour(#ff4444);
		if modtype==4 {
			draw_text_transformed(80, 590, "是否删除当前谱面:",0.3,0.3,0);
			draw_text_transformed(80, 630, global.filelist[global.chart]+"."+string(global.level),0.3,0.3,0);
			draw_text_transformed(80, 680, "Enter: 确认 / ESC: 取消",0.3,0.3,0);
		}
	}
	draw_triangle(50,340+50*modtype,35,350+50*modtype,35,330+50*modtype,false);
	draw_set_colour(c_white);
	draw_text_transformed(80, 340, "编辑当前谱面",0.3,0.3,0);
	draw_text_transformed(80, 390, "导入音乐并创建谱面",0.3,0.3,0);
	draw_text_transformed(80, 440, "创建新谱面",0.3,0.3,0);
	draw_text_transformed(80, 490, "复制当前谱面",0.3,0.3,0);
	if (array_length(global.fileread)<=5){
		draw_set_colour(c_gray);
	}
	else{
		draw_set_colour(c_white);
	}
	draw_text_transformed(80, 540, "删除当前谱面",0.3,0.3,0);
}