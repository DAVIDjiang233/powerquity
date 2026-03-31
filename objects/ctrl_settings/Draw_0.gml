draw_set_valign(fa_middle);
draw_set_font(global.fontall);
draw_set_colour(c_white);

draw_set_halign(fa_middle);
var rx=-100,ry=0,lx=-100,ly=0;
if(setbase<=1){
	draw_text_transformed(640, 100, "按键设置",0.4,0.4,0);
	draw_triangle(1200,100,1170,116,1170,76,false);
	
	draw_text_transformed(340, 200, "Mania模式",0.4,0.4,0);
	draw_text_transformed(940, 200, "QWERTYUIOP!!模式",0.4,0.4,0);
	
	draw_set_halign(fa_left);
	draw_text_transformed(270, 300, "键位1: "+chr(global.settings[2])+"("+string(global.settings[2])+")",0.3,0.3,0);
	draw_text_transformed(270, 350, "键位2: "+chr(global.settings[3])+"("+string(global.settings[3])+")",0.3,0.3,0);
	draw_text_transformed(270, 400, "键位3: "+chr(global.settings[4])+"("+string(global.settings[4])+")",0.3,0.3,0);
	draw_text_transformed(270, 450, "键位4: "+chr(global.settings[5])+"("+string(global.settings[5])+")",0.3,0.3,0);
	
	draw_text_transformed(270, 550, "重玩: "+chr(global.settings[18])+"("+string(global.settings[18])+")",0.3,0.3,0);
	draw_text_transformed(270, 600, "快速暂停: "+chr(global.settings[19])+"("+string(global.settings[19])+")",0.3,0.3,0);

	draw_text_transformed(830, 300, "键位1: "+chr(global.settings[13])+"("+string(global.settings[13])+")",0.3,0.3,0);
	draw_text_transformed(830, 350, "键位2: "+chr(global.settings[14])+"("+string(global.settings[14])+")",0.3,0.3,0);
	draw_text_transformed(830, 400, "键位3: "+chr(global.settings[15])+"("+string(global.settings[15])+")",0.3,0.3,0);
	draw_text_transformed(830, 450, "键位4: "+chr(global.settings[16])+"("+string(global.settings[16])+")",0.3,0.3,0);
	if(settype<=3){
		ry=300+50*settype;
	}
	else{
		ry=350+50*settype;
	}
	
	rx=250+setbase*560;
	if(changekey==1){
		ly=ry;
		lx=rx+220;
	}
}
else if(setbase<=3){
	draw_triangle(80,100,110,116,110,76,false);
	draw_text_transformed(340, 100, "视觉",0.4,0.4,0);
	draw_text_transformed(940, 100, "玩法",0.4,0.4,0);
	
	draw_text_transformed(940, 550, "音频",0.4,0.4,0);
	draw_text_transformed(340, 550, "其它",0.4,0.4,0);
	
	draw_set_halign(fa_left);
	draw_text_transformed(170, 200, "屏幕分辨率: "+string(320*real(global.settings[1]))+"*"+string(184*real(global.settings[1])),0.3,0.3,0);
	
	if global.settings[7]==0 draw_text_transformed(170, 250, "显示判定详情: 关",0.3,0.3,0);
	else draw_text_transformed(170, 250, "显示判定详情: 开",0.3,0.3,0);

	var _type;
	if global.settings[8]<0 _type="(不显示)";
	else if global.settings[8]<160 _type="(顶端)";
	else if global.settings[8]<320 _type="(偏上)";
	else if global.settings[8]<480 _type="(中心)";
	else if global.settings[8]<640 _type="(偏下)";
	else if global.settings[8]<736 _type="(底部)";
	else _type="(不显示)";
	draw_text_transformed(170, 300, "准确率y坐标: "+string(global.settings[8])+_type,0.3,0.3,0);
	if global.settings[9]<0 _type="(不显示)";
	else if global.settings[9]<160 _type="(顶端)";
	else if global.settings[9]<320 _type="(偏上)";
	else if global.settings[9]<480 _type="(中心)";
	else if global.settings[9]<640 _type="(偏下)";
	else if global.settings[9]<736 _type="(底部)";
	else _type="(不显示)";
	draw_text_transformed(170, 350, "打击量计y坐标: "+string(global.settings[9])+_type,0.3,0.3,0);
	if global.settings[10]<0 _type="(不显示)";
	else if global.settings[10]<160 _type="(顶端)";
	else if global.settings[10]<320 _type="(偏上)";
	else if global.settings[10]<480 _type="(中心)";
	else if global.settings[10]<640 _type="(偏下)";
	else if global.settings[10]<736 _type="(底部)";
	else _type="(不显示)";
	draw_text_transformed(170, 400, "Early/Late指示器y坐标: "+string(global.settings[10])+_type,0.3,0.3,0);
	draw_text_transformed(170, 450, "限制帧率: "+string(global.settings[17]),0.3,0.3,0);
	
	
	draw_text_transformed(770, 200, "音符流速: "+string(global.settings[0]),0.3,0.3,0);
	if global.settings[12]==0 draw_text_transformed(770, 250, "自动开启镜像: 关",0.3,0.3,0);
	else draw_text_transformed(770, 250, "自动开启镜像: 开",0.3,0.3,0);
	if global.settings[11]==0 draw_text_transformed(770, 300, "QWERTYUIOP!!模式自动换轨: 关",0.3,0.3,0);
	else draw_text_transformed(770, 300, "QWERTYUIOP!!模式自动换轨: 开",0.3,0.3,0);
	
	draw_text_transformed(170, 620, "前往GitHub",0.3,0.3,0);
	
	draw_text_transformed(770, 620, "音频延迟: "+string(global.settings[6]),0.3,0.3,0);
	
	rx=-1050+setbase*600;
	if(setbase==2){
		if(settype>=6){
			ry=620;
		}
		else ry=200+50*settype;
	}
	else{
		if(settype>=3){
			ry=620;
		}
		else ry=200+50*settype;
	}
	if(changekey==1){
		ly=ry;
		lx=rx-15;
		rx+=495;
	}

}
draw_triangle(rx,ry,rx-15,ry+10,rx-15,ry-10,false);
draw_triangle(lx,ly,lx+15,ly+10,lx+15,ly-10,false);
