if (ctrl_chartdesign.designview>0) exit;
if (ctrl_chartdesign.designview<-1) exit;
if (ctrl_chartdesign.designview==-1&&array_length(global.choose)==0) exit;

draw_set_alpha(1);
draw_self();
draw_set_halign(fa_middle);
if type==0{
	if (array_length(global.choose)==0){
	
	if (global.notetype[0]=="T"){
			draw_set_color(#00ffff);
			draw_text_transformed(x,y,"普通tap",0.22,0.22,0);
		}
		else if (global.notetype[0]=="BP"){
			draw_set_color(#3377ff);
			draw_text_transformed(x,y,"双轨tap",0.22,0.22,0);
		}
		else if (global.notetype[0]=="TP"){
			draw_set_color(#00E572);
			draw_text_transformed(x,y,"三轨tap",0.22,0.22,0);
		}
		else if (global.notetype[0]=="QP"){
			draw_set_color(#ED008C);
			draw_text_transformed(x,y,"四轨tap",0.22,0.22,0);
		}
		else if (global.notetype[0]=="B"){
			draw_set_color(#aaaaaa);
			draw_text_transformed(x,y,"小节线",0.22,0.22,0);
		}
		else if (global.notetype[0]=="F"){
			draw_set_color(#ffffff);
			draw_text_transformed(x,y,"假note",0.22,0.22,0);
		}
		else if (global.notetype[0]=="N"){
			draw_set_color(#33aaff);
			draw_text_transformed(x,y,"尾判",0.22,0.22,0);
		}
		else if (global.notetype[0]=="M"){
			draw_set_color(#ff5555);
			draw_text_transformed(x,y,"地雷键",0.22,0.22,0);
		}
		else if (global.notetype[0]=="A"){
			draw_set_color(#ffff00);
			draw_text_transformed(x,y,"Drag",0.22,0.22,0);
		}
		else if (global.notetype[0]=="RT"){
			draw_set_color(#00ffff);
			draw_text_transformed(x,y,"随机Tap",0.22,0.22,0);
		}
		else if (global.notetype[0]=="RF"){
			draw_set_color(#ffffff);
			draw_text_transformed(x,y,"随机假键",0.22,0.22,0);
		}
		else if (global.notetype[0]=="RA"){
			draw_set_color(#ffff00);
			draw_text_transformed(x,y,"随机Drag",0.22,0.22,0);
		}
		else if (global.notetype[0]=="RM"){
			draw_set_color(#ff5555);
			draw_text_transformed(x,y,"随机地雷",0.22,0.22,0);
		}
	
	}
	
	else{
		var _vist=0;
		for (var i=1;i<array_length(global.choose);i++){
			if global.chartread[global.choose[0]][0]!=global.chartread[global.choose[i]][0]{
			_vist=1;
			break;
			}
		}
		if _vist==0{
		
			if (global.chartread[global.choose[0]][0]=="T"){
				draw_set_color(#00ffff);
				draw_text_transformed(x,y,"普通tap",0.22,0.22,0);
			}
			else if (global.chartread[global.choose[0]][0]=="BP"){
				draw_set_color(#3377ff);
				draw_text_transformed(x,y,"双轨tap",0.22,0.22,0);
			}
			else if (global.chartread[global.choose[0]][0]=="TP"){
				draw_set_color(#00E572);
				draw_text_transformed(x,y,"三轨tap",0.22,0.22,0);
			}
			else if (global.chartread[global.choose[0]][0]=="QP"){
				draw_set_color(#ED008C);
				draw_text_transformed(x,y,"四轨tap",0.22,0.22,0);
			}
			else if (global.chartread[global.choose[0]][0]=="B"){
				draw_set_color(#aaaaaa);
				draw_text_transformed(x,y,"小节线",0.22,0.22,0);
			}
			else if (global.chartread[global.choose[0]][0]=="F"){
				draw_set_color(#ffffff);
				draw_text_transformed(x,y,"假note",0.22,0.22,0);
			}
			else if (global.chartread[global.choose[0]][0]=="N"){
				draw_set_color(#33aaff);
				draw_text_transformed(x,y,"尾判",0.22,0.22,0);
			}
			else if (global.chartread[global.choose[0]][0]=="M"){
				draw_set_color(#ff5555);
				draw_text_transformed(x,y,"地雷键",0.22,0.22,0);
			}
			else if (global.chartread[global.choose[0]][0]=="A"){
				draw_set_color(#ffff00);
				draw_text_transformed(x,y,"Drag",0.22,0.22,0);
			}
			else if (global.chartread[global.choose[0]][0]=="L"){
				draw_set_color(#55aaff);
				draw_text_transformed(x,y,"假长条",0.22,0.22,0);
			}
			else if (global.chartread[global.choose[0]][0]=="LN"){
				draw_set_color(#55ccff);
				draw_text_transformed(x,y,"长条",0.22,0.22,0);
			}
			else if (global.chartread[global.choose[0]][0]=="P"){
				draw_set_color(#ffffff);
				draw_text_transformed(x,y,"轨道颜色",0.22,0.22,0);
			}
			else if (global.chartread[global.choose[0]][0]=="RT"){
				draw_set_color(#00ffff);
				draw_text_transformed(x,y,"随机tap",0.22,0.22,0);
			}
			else if (global.chartread[global.choose[0]][0]=="RF"){
				draw_set_color(#ffffff);
				draw_text_transformed(x,y,"随机假键",0.22,0.22,0);
			}
			else if (global.chartread[global.choose[0]][0]=="RA"){
				draw_set_color(#ffff00);
				draw_text_transformed(x,y,"随机drag",0.22,0.22,0);
			}
			else if (global.chartread[global.choose[0]][0]=="RM"){
				draw_set_color(#ff5555);
				draw_text_transformed(x,y,"随机地雷",0.22,0.22,0);
			}
		}
		else {
			draw_set_color(#aaaaaa);
			draw_text_transformed(x,y,"Note类型",0.22,0.22,0);
		}
	}
}