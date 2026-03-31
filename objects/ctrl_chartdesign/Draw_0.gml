draw_set_halign(fa_left);
draw_set_font(global.fontall);
draw_set_colour(c_white);
draw_set_alpha(1);

var _zwrite = gpu_get_zwriteenable();
var _ztest = gpu_get_ztestenable();
gpu_set_zwriteenable(true);
gpu_set_ztestenable(true);
var _depth = gpu_get_depth();

//draw_text_transformed(50, 400,string(gametype),0.3,0.3,0);
draw_text_transformed(64, 510,"流速:"+string(global.globalspeed),0.3,0.3,0);
draw_text_transformed(64, 550,"timing:"+string(global.playtime),0.3,0.3,0);
//draw_text_transformed(100, 550,string(global.list),0.3,0.3,0);

if (designview==0){
	gpu_set_depth(8266);
	draw_sprite(spr_backban,0,512,608);
	gpu_set_depth(8000);
	for (var i = 0; i < array_length(global.barlist); i++) {
		draw_set_color(global.barlist[i][1]);
		var bar_time = global.barlist[i][0];
		
		var _y=(global.playtime-bar_time)*0.25*global.globalspeed+610
		if global.barlist[i][1]==#FC3636 
			draw_line_width(298,_y,724,_y,5);
		else if global.barlist[i][1]==#B36CFF||global.barlist[i][1]==#0093FD
			draw_line_width(298,_y,724,_y,4);
		else if global.barlist[i][1]==#F2C94C||global.barlist[i][1]==#F758A4
			draw_line_width(298,_y,724,_y,3);
		else draw_line_width(298,_y,724,_y,2);
				
		draw_set_halign(fa_left);
		if real(global.barlist[i][2])>=1
		draw_text_transformed(730,_y,"  "+string(global.barlist[i][2]),0.23,0.23,0);
		else if real(global.barlist[i][2])>0 
		draw_text_transformed(730,_y," "+string(global.barlist[i][2])+"/"+string(global.barline),0.2,0.2,0);
	}
	
	
	
	gpu_set_depth(_depth);
	var _q=global.list,_canread=0;
	while(_q>=0){
		
		if(_canread==1) _canread=0;
		if real(global.chartread[_q][1])<global.playtime-20000 break;
		
		if(timinggroup<0||global.chartread[_q][3]==timinggroup){
			if array_get_index(global.choose,_q)==-1 draw_set_alpha(0.65);
			else draw_set_alpha(1);
		
			if(global.chartread[_q][0]=="T"){
				draw_sprite(spr_tap,0,
					257+102*real(global.chartread[_q][2]),
					608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25
				);
				if(_canread==0) _canread=1;
			}
			else if(global.chartread[_q][0]=="RT"){
				var _track=global.chartread[_q][4+floor(global.rand[real(global.chartread[_q][2])]*(array_length(global.chartread[_q])-4))];
				if (_track=="none"){
					_track=0;
				}
				draw_sprite(spr_tap,0,
					257+102*real(_track),
					608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25
				);
				if(_canread==0){
					if(608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25<mouse_y+30
					&&608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25>mouse_y-10
					&&round((mouse_x-257)/102-real(_track))==0){
						draw_set_colour(c_green);
						draw_set_alpha(0.5);
						draw_rectangle(
						205+102*real(_track),
						578+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25,
						308+102*real(_track),
						618+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25,0)
						_canread=2;
						draw_set_colour(c_white);
						draw_set_alpha(1);
					}
				}
			}
			else if(global.chartread[_q][0]=="BP"){
				draw_sprite(spr_bumper,0,
					257+102*real(global.chartread[_q][2]),
					608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25
				);
				if(_canread==0) _canread=1;
			}
			else if(global.chartread[_q][0]=="TP"){
				draw_sprite(spr_triper,0,
					257+102*real(global.chartread[_q][2]),
					608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25
				);
				if(_canread==0) _canread=1;
			}
			else if(global.chartread[_q][0]=="QP"){
				draw_sprite(spr_quader,0,
					257+102*real(global.chartread[_q][2]),
					608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25
				);
				if(_canread==0) _canread=1;
			}
			else if(global.chartread[_q][0]=="F"){
				draw_sprite_ext(spr_fakekey,0,
					257+102*real(global.chartread[_q][2]),
					608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25,
					1,1,0,real(global.chartread[_q][4]),draw_get_alpha()
				);
				if(_canread==0) _canread=1;
			}
			else if(global.chartread[_q][0]=="RF"){
				var _track=global.chartread[_q][5+floor(global.rand[real(global.chartread[_q][2])]*(array_length(global.chartread[_q])-5))];
				if (_track=="none"){
					_track=0;
				}
				draw_sprite_ext(spr_fakekey,0,
					257+102*real(_track),
					608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25,
					1,1,0,real(global.chartread[_q][4]),draw_get_alpha()
				);
				if(_canread==0){
					if(608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25<mouse_y+30
					&&608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25>mouse_y-10
					&&round((mouse_x-257)/102-real(_track))==0){
						draw_set_colour(c_green);
						draw_set_alpha(0.5);
						draw_rectangle(
						205+102*real(_track),
						578+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25,
						308+102*real(_track),
						618+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25,0)
						_canread=2;
						draw_set_colour(c_white);
						draw_set_alpha(1);
					}
				}
			}
			else if(global.chartread[_q][0]=="B"){
				gpu_set_depth(-5000);
				draw_sprite(spr_barline,0,
					257+102*real(global.chartread[_q][2]),
					608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25
				);
				gpu_set_depth(_depth);
				if(_canread==0) _canread=1;
			}
			else if(global.chartread[_q][0]=="N"){
				draw_sprite(spr_endtap,0,
					257+102*real(global.chartread[_q][2]),
					608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25
				);
				if(_canread==0) _canread=1;
			}
			else if(global.chartread[_q][0]=="M"){
				draw_sprite(spr_misstap,0,
					257+102*real(global.chartread[_q][2]),
					608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25
				);
				if(_canread==0) _canread=1;
			}
			
			else if(global.chartread[_q][0]=="RM"){
				var _track=global.chartread[_q][4+floor(global.rand[real(global.chartread[_q][2])]*(array_length(global.chartread[_q])-4))];
				if (_track=="none"){
					_track=0;
				}
				draw_sprite(spr_misstap,0,
					257+102*real(_track),
					608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25
				);
				if(_canread==0){
					if(608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25<mouse_y+30
					&&608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25>mouse_y-10
					&&round((mouse_x-257)/102-real(_track))==0){
						draw_set_colour(c_green);
						draw_set_alpha(0.5);
						draw_rectangle(
						205+102*real(_track),
						578+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25,
						308+102*real(_track),
						618+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25,0)
						_canread=2;
						draw_set_colour(c_white);
						draw_set_alpha(1);
					}
				}
			}
			else if(global.chartread[_q][0]=="A"){
				draw_sprite(spr_touchap,0,
					257+102*real(global.chartread[_q][2]),
					608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25
				);
				if(_canread==0) _canread=1;
			}
			
			else if(global.chartread[_q][0]=="RA"){
				var _track=global.chartread[_q][4+floor(global.rand[real(global.chartread[_q][2])]*(array_length(global.chartread[_q])-4))];
				if (_track=="none"){
					_track=0;
				}
				draw_sprite(spr_touchap,0,
					257+102*real(_track),
					608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25
				);
				if(_canread==0){
					if(608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25<mouse_y+30
					&&608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25>mouse_y-10
					&&round((mouse_x-257)/102-real(_track))==0){
						draw_set_colour(c_green);
						draw_set_alpha(0.5);
						draw_rectangle(
						205+102*real(_track),
						578+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25,
						308+102*real(_track),
						618+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25,0)
						_canread=2;
						draw_set_colour(c_white);
						draw_set_alpha(1);
					}
				}
			}
			else if(global.chartread[_q][0]=="L"){
				var _x=257+102*real(global.chartread[_q][2]),
				yup=608+(global.playtime-real(global.chartread[_q][4]))*global.globalspeed*0.25,
				ydo=608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25;
				gpu_set_depth(6000);
				if (draw_get_alpha()==1){
					draw_sprite_pos(spr_lnkey,0,_x-36,yup,_x+36,yup,_x+36,ydo,_x-36,ydo,0.5);
				}
				else{
					draw_sprite_pos(spr_lnkey,0,_x-36,yup,_x+36,yup,_x+36,ydo,_x-36,ydo,0.3);
				}
				gpu_set_depth(_depth);
				if(_canread==0) _canread=1;
			}
			else if(global.chartread[_q][0]=="LN"){
				var _x=257+102*real(global.chartread[_q][2]),
				yup=608+(global.playtime-real(global.chartread[_q][4]))*global.globalspeed*0.25,
				ydo=608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25;
				draw_sprite(spr_tap,0,_x,ydo);
				gpu_set_depth(6000);
				if (draw_get_alpha()==1){
					draw_sprite_pos(spr_lnkey,0,_x-36,yup,_x+36,yup,_x+36,ydo,_x-36,ydo,0.7);
				}
				else{
					draw_sprite_pos(spr_lnkey,0,_x-36,yup,_x+36,yup,_x+36,ydo,_x-36,ydo,0.4);
				}
				gpu_set_depth(_depth);
				if(_canread==0) _canread=1;
			}
			else if(global.chartread[_q][0]=="P"){
				var _x=257+102*real(global.chartread[_q][2]),
				_y=608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25;
				if global.chartread[_q][4]=="1" draw_set_colour(#ff0000);
				if global.chartread[_q][4]=="2" draw_set_colour(#ffff00);
				if global.chartread[_q][4]=="3" draw_set_colour(#00ff00);
				if global.chartread[_q][4]=="4" draw_set_colour(#0000ff);
				gpu_set_depth(-4000);
				draw_rectangle(_x-48,_y-12,_x+47,_y,false);
				gpu_set_depth(_depth);
				draw_set_colour(c_white);
				if(_canread==0) _canread=1;
			}
			
			if (keyboard_check(vk_control)){
				gpu_set_depth(-5000);
				draw_set_color(c_white);
				draw_text_transformed(
				257+102*real(global.chartread[_q][2]),
				608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25,
				string(global.chartread[_q][3]),0.22,0.22,0);
				gpu_set_depth(_depth);
			}
			if(_canread==1){
				if(608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25<mouse_y+30
				&&608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25>mouse_y-10
				&&round((mouse_x-257)/102-real(global.chartread[_q][2]))==0){
					draw_set_colour(c_green);
					draw_set_alpha(0.5);
					draw_rectangle(
					205+102*real(global.chartread[_q][2]),
					578+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25,
					308+102*real(global.chartread[_q][2]),
					618+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25,0)
					_canread=2;
					draw_set_colour(c_white);
					draw_set_alpha(1);
				}
			}
		}
		_q--;
	
	}

	if (mouse_x>311&&mouse_x<715&&_canread!=2){
		draw_set_alpha(0.5);
		if (global.barline>0&&(608+(global.playtime-global.bpmlist[0][0])*global.globalspeed*0.25)>mouse_y){
			draw_sprite(spr_fakekey,0,
					257+102*round((mouse_x-257)/102),
					608+(global.playtime-scr_barfind(global.barlist,global.mousetime))*global.globalspeed*0.25
				);

		}
		else if((608+(global.playtime)*global.globalspeed*0.25)>mouse_y&&mouse_y<608){
			draw_sprite(spr_fakekey,0,
					257+102*round((mouse_x-257)/102),
					mouse_y
				);
		}
		draw_set_alpha(1);
	}
	
	if (holdinput>=0){
		
		var _x=257+102*holdtrack,
			yup=608+(global.playtime-holdinput)*global.globalspeed*0.25,
			ydo;
		if (global.barline>0&&holdinput<scr_barfind(global.barlist,global.mousetime)){
			ydo=608+(global.playtime-scr_barfind(global.barlist,global.mousetime))*global.globalspeed*0.25;
		}
		else if(global.barline==0&&holdinput<global.mousetime){
			ydo=608+(global.playtime-global.mousetime)*global.globalspeed*0.25;
		}
		else ydo=yup;

		draw_sprite_pos(spr_lnkey,0,_x-36,yup,_x+36,yup,_x+36,ydo,_x-36,ydo,0.5);
			
	}
	if (square_y!=-1){
		draw_set_alpha(0.4);
		gpu_set_depth(-9999);
		draw_set_color(#00cc00);
		draw_rectangle(mouse_x,mouse_y,square_x*102+257,((global.playtime-square_y)*global.globalspeed/4)+608,0);
	}
	if(mouse_x>64&&mouse_x<224&&mouse_y>640&&mouse_y<704){
		gpu_set_depth(-10101);
		if(help==0){
			draw_set_alpha(1);
			draw_set_color(#ffff00);
			draw_set_halign(fa_left);
			draw_text_transformed(32,600,"制谱器基础教程\n单击鼠标左键切换下一页",0.23,0.23,0);
		}
		else if(help==1){
			draw_set_color(#000000);
			draw_set_alpha(0.7);
			draw_rectangle(250,0,800,1000,0);
			draw_set_alpha(1);
			draw_set_color(#ffffff);
			draw_set_halign(fa_left);
			draw_text_transformed(244,48,"←保存按钮，鼠标左键点击",0.23,0.23,0);
			draw_text_transformed(244,128,"←切换游戏模式，鼠标左键点击\nMania模式为传统4K，QWERTYUIOP!!模式为2K+2K",0.23,0.23,0);
			draw_text_transformed(244,208,"←音频延迟调整，鼠标左键点击",0.23,0.23,0);
			draw_text_transformed(244,368,"←修改谱面信息，鼠标左键点击",0.23,0.23,0);
			draw_text_transformed(800,592,"鼠标滚轮\n↓随机数调整",0.23,0.23,0);
			draw_set_halign(fa_middle);
			draw_text_transformed(1104,96,"↑谱面流速&小节线↑\n鼠标左键点击",0.23,0.23,0);
			draw_text_transformed(144,600,"基础控件",0.3,0.3,0);
			draw_set_color(c_gray);
			draw_sprite_ext(spr_btn,0,864,208,4,1,0,c_gray,1);
			draw_text_transformed(864,208,"轨道",0.23,0.23,0);
			draw_sprite_ext(spr_btn,0,1024,208,4,1,0,c_gray,1);
			draw_text_transformed(1024,208,"时间",0.23,0.23,0);
			draw_sprite_ext(spr_btn,0,1024,256,4,1,0,c_gray,1);
			draw_text_transformed(1024,256,"特殊",0.23,0.23,0);
			draw_set_color(#ffffff);
			draw_set_halign(fa_right);
			draw_text_transformed(784,64,"谱面播放速度调整→\n鼠标滚轮，范围0.25~2.00",0.23,0.23,0);
			draw_text_transformed(1184,160,"谱面进度条，可拖动↑",0.23,0.23,0);
			draw_text_transformed(1184,288,"↑Note编辑，左键点击↑",0.23,0.23,0);
			draw_text_transformed(1248,624,"鼠标滚轮或左键点击\n视图编辑↓",0.23,0.23,0);
		}
		else if(help==2){
			draw_set_color(#000000);
			draw_set_alpha(0.7);
			draw_rectangle(250,0,800,1000,0);
			draw_set_alpha(1);
			draw_set_color(#ffffff);
			draw_set_halign(fa_left);
			draw_text_transformed(320,350,"Q：放置主要note\n按住W：放置hold\nE：放置假note\nR：放置QWERTYUIOP模式变轨提示\n\n鼠标左键：选择note\n鼠标左键+Ctrl：多选\n鼠标左键+Shift：框选\n\n鼠标右键：删除note\nDeleat：删除选中的note",0.3,0.3,0);
			draw_set_halign(fa_middle);
			draw_text_transformed(144,600,"note相关",0.3,0.3,0);
			draw_set_halign(fa_right);
		}
		else if(help==3){
			draw_set_color(#000000);
			draw_set_alpha(0.7);
			draw_rectangle(250,0,800,1000,0);
			draw_set_alpha(1);
			draw_set_color(#ffffff);
			draw_set_halign(fa_left);
			draw_text_transformed(320,350,"M 镜像\n\nCtrl+Z 撤销\nCtrl+Y 重做\nCtrl+C 复制\nCtrl+V 粘贴\nCtrl+X 剪切\n\nShift+鼠标滚轮：调节流速\nCtrl+鼠标滚轮：小节线密度×2/÷2\nCtrl+Shift+鼠标滚轮：小节线密度+1/-1\n\nESC+S 保存并退出\nESC+N 不保存退出",0.3,0.3,0);
			draw_set_halign(fa_middle);
			draw_text_transformed(144,600,"快捷键",0.3,0.3,0);
			draw_set_halign(fa_right);
		}
	}
}

else if (designview==1){
	gpu_set_depth(8266);
	draw_sprite(spr_backban,0,512,608);
	gpu_set_depth(8000);
	for (var i = 0; i < array_length(global.barlist); i++) {
		draw_set_color(global.barlist[i][1]);
		var bar_time = global.barlist[i][0];
		
		var _y=(global.playtime-bar_time)*0.25*global.globalspeed+610
		if global.barlist[i][1]==#FC3636 
			draw_line_width(298,_y,724,_y,5);
		else if global.barlist[i][1]==#B36CFF||global.barlist[i][1]==#0093FD
			draw_line_width(298,_y,724,_y,4);
		else if global.barlist[i][1]==#F2C94C||global.barlist[i][1]==#F758A4
			draw_line_width(298,_y,724,_y,3);
		else draw_line_width(298,_y,724,_y,2);
		draw_set_halign(fa_left);
		if real(global.barlist[i][2])>=1
		draw_text_transformed(730,_y,"  "+string(global.barlist[i][2]),0.23,0.23,0);
		else if real(global.barlist[i][2])>0 
		draw_text_transformed(730,_y," "+string(global.barlist[i][2])+"/"+string(global.barline),0.2,0.2,0);
	}
	if(timinggroup>=0){
		draw_set_halign(fa_middle);
		
	{
		var _canread=1;
		
		
		if(array_length(global.svchange[1])>=timinggroup){
			var _svst=scr_svget(global.svchange[1][timinggroup],global.playtime-10000,0);
			var _svet=scr_svget(global.svchange[1][timinggroup],global.playtime+5000,0);
			
			while(_svst<_svet){
				_svst++;
				draw_set_colour(#ff0000);
				if (array_get_index(global.svchoose[1],_svst)==-1) draw_set_alpha(0.65);
				var _y=(global.playtime-global.svchange[1][timinggroup][_svst][0])*0.25*global.globalspeed+610;
				draw_rectangle(311,_y-12,406,_y,false);
				draw_set_colour(#ffffff);
				draw_set_alpha(1);
				draw_text_transformed(359,_y,string(global.svchange[1][timinggroup][_svst][1]),0.22,0.22,0);
				if(_canread==1){
					if(_y<mouse_y+30&&_y>mouse_y-30&&round((mouse_x-257)/102)==1){
						draw_set_colour(c_green);
						draw_set_alpha(0.5);
						draw_rectangle(205+102,_y-18,308+102,_y+6,0)
						_canread=2;
						draw_set_colour(c_white);
						draw_set_alpha(1);
					}
				}
			}
		}
		if(array_length(global.svchange[2])>=timinggroup){
			var _svst=scr_svget(global.svchange[2][timinggroup],global.playtime-10000,0);
			var _svet=scr_svget(global.svchange[2][timinggroup],global.playtime+5000,0);
			
			while(_svst<_svet){
				_svst++;
				draw_set_colour(#ffbb00);
				if (array_get_index(global.svchoose[2],_svst)==-1) draw_set_alpha(0.65);
				var _y=(global.playtime-global.svchange[2][timinggroup][_svst][0])*0.25*global.globalspeed+610;
				draw_rectangle(413,_y-12,508,_y,false);
				draw_set_colour(#ffffff);
				draw_set_alpha(1);
				draw_text_transformed(461,_y,string(global.svchange[2][timinggroup][_svst][1]),0.22,0.22,0);
				if(_canread==1){
					if(_y<mouse_y+30&&_y>mouse_y-30&&round((mouse_x-257)/102)==2){
						draw_set_colour(c_green);
						draw_set_alpha(0.5);
						draw_rectangle(205+204,_y-18,308+204,_y+6,0)
						_canread=2;
						draw_set_colour(c_white);
						draw_set_alpha(1);
					}
				}
			}
		}
		if(array_length(global.svchange[3])>=timinggroup){
			var _svst=scr_svget(global.svchange[3][timinggroup],global.playtime-10000,0);
			var _svet=scr_svget(global.svchange[3][timinggroup],global.playtime+5000,0);
			
			while(_svst<_svet){
				_svst++;
				draw_set_colour(#00cc00);
				if (array_get_index(global.svchoose[3],_svst)==-1) draw_set_alpha(0.65);
				var _y=(global.playtime-global.svchange[3][timinggroup][_svst][0])*0.25*global.globalspeed+610;
				draw_rectangle(515,_y-12,610,_y,false);
				draw_set_colour(#ffffff);
				draw_set_alpha(1);
				draw_text_transformed(563,_y,string(global.svchange[3][timinggroup][_svst][1]),0.22,0.22,0);
				if(_canread==1){
					if(_y<mouse_y+30&&_y>mouse_y-30&&round((mouse_x-257)/102)==3){
						draw_set_colour(c_green);
						draw_set_alpha(0.5);
						draw_rectangle(205+306,_y-18,308+306,_y+6,0)
						_canread=2;
						draw_set_colour(c_white);
						draw_set_alpha(1);
					}
				}
			}
		}
		if(array_length(global.svchange[4])>=timinggroup){
			var _svst=scr_svget(global.svchange[4][timinggroup],global.playtime-10000,0);
			var _svet=scr_svget(global.svchange[4][timinggroup],global.playtime+5000,0);
			
			while(_svst<_svet){
				_svst++;
				draw_set_colour(#00aaff);
				if (array_get_index(global.svchoose[4],_svst)==-1) draw_set_alpha(0.65);
				var _y=(global.playtime-global.svchange[4][timinggroup][_svst][0])*0.25*global.globalspeed+610;
				draw_rectangle(617,_y-12,712,_y,false);
				draw_set_colour(#ffffff);
				draw_set_alpha(1);
				draw_text_transformed(665,_y,string(global.svchange[4][timinggroup][_svst][1]),0.22,0.22,0);
				if(_canread==1){
					if(_y<mouse_y+30&&_y>mouse_y-30&&round((mouse_x-257)/102)==4){
						draw_set_colour(c_green);
						draw_set_alpha(0.5);
						draw_rectangle(205+408,_y-18,308+408,_y+6,0)
						_canread=2;
						draw_set_colour(c_white);
						draw_set_alpha(1);
					}
				}
			}
		}
		if(array_length(global.svchange[5])>=timinggroup){
			var _svst=scr_svget(global.svchange[5][timinggroup],global.playtime-10000,0);
			var _svet=scr_svget(global.svchange[5][timinggroup],global.playtime+5000,0);
			
			while(_svst<_svet){
				_svst++;
				draw_set_colour(#ff6666);
				if (array_get_index(global.svchoose[5],_svst)==-1) draw_set_alpha(0.65);
				
				var _ydo=(global.playtime-global.svchange[5][timinggroup][_svst][0])*0.25*global.globalspeed+610,
				_yup=(global.playtime-global.svchange[5][timinggroup][_svst][0]-global.svchange[5][timinggroup][_svst][2])*0.25*global.globalspeed+610;
				draw_rectangle(349,_yup,369,_ydo,false);
				draw_rectangle(343,_ydo-12,376,_ydo,false);
				scr_drawline(_ydo,_yup,396,323,global.svchange[5][timinggroup][_svst][3]);
				draw_set_colour(#ff0000);
				scr_drawline(_ydo,_yup,323,396,global.svchange[5][timinggroup][_svst][3]);
				draw_set_alpha(1);
				draw_set_colour(#ffffff);
				if (!keyboard_check(vk_control)){
					draw_text_transformed(359,_ydo,string(global.svchange[5][timinggroup][_svst][1]),0.22,0.22,0);
				}
				else draw_text_transformed(359,_ydo,scr_easename(global.svchange[5][timinggroup][_svst][3]),0.22,0.22,0);
				
				if(_canread==1){
					if(_ydo<mouse_y+30&&_ydo>mouse_y-30&&round((mouse_x-257)/102)==1&&!keyboard_check(vk_tab)){
						draw_set_colour(c_green);
						draw_set_alpha(0.5);
						draw_rectangle(225+102,_ydo-18,288+102,_ydo+6,0)
						_canread=2;
						draw_set_colour(c_white);
						draw_set_alpha(1);
					}
				}
				
			}
		}
		if(array_length(global.svchange[6])>=timinggroup){
			var _svst=scr_svget(global.svchange[6][timinggroup],global.playtime-10000,0);
			var _svet=scr_svget(global.svchange[6][timinggroup],global.playtime+5000,0);
			
			while(_svst<_svet){
				_svst++;
				draw_set_colour(#ffff66);
				if (array_get_index(global.svchoose[6],_svst)==-1) draw_set_alpha(0.65);
				var _ydo=(global.playtime-global.svchange[6][timinggroup][_svst][0])*0.25*global.globalspeed+610,
				_yup=(global.playtime-global.svchange[6][timinggroup][_svst][0]-global.svchange[6][timinggroup][_svst][2])*0.25*global.globalspeed+610;
				draw_rectangle(451,_yup,471,_ydo,false);
				draw_rectangle(445,_ydo-12,478,_ydo,false);
				scr_drawline(_ydo,_yup,498,425,global.svchange[6][timinggroup][_svst][3]);
				draw_set_colour(#ffbb00);
				scr_drawline(_ydo,_yup,425,498,global.svchange[6][timinggroup][_svst][3]);
				draw_set_colour(#ffffff);
				draw_set_alpha(1);
				if (!keyboard_check(vk_control)){
				draw_text_transformed(461,_ydo,string(global.svchange[6][timinggroup][_svst][1]),0.22,0.22,0);
				}
				else{draw_text_transformed(461,_ydo,scr_easename(global.svchange[6][timinggroup][_svst][3]),0.22,0.22,0);
				}
				if(_canread==1){
					if(_ydo<mouse_y+30&&_ydo>mouse_y-30&&round((mouse_x-257)/102)==2&&!keyboard_check(vk_tab)){
						draw_set_colour(c_green);
						draw_set_alpha(0.5);
						draw_rectangle(225+204,_ydo-18,288+204,_ydo+6,0)
						_canread=2;
						draw_set_colour(c_white);
						draw_set_alpha(1);
					}
				}
			}
		}
		if(array_length(global.svchange[7])>=timinggroup){
			var _svst=scr_svget(global.svchange[7][timinggroup],global.playtime-10000,0);
			var _svet=scr_svget(global.svchange[7][timinggroup],global.playtime+5000,0);
			
			while(_svst<_svet){
				_svst++;
				draw_set_colour(#66ff66);
				if (array_get_index(global.svchoose[7],_svst)==-1) draw_set_alpha(0.65);
				var _ydo=(global.playtime-global.svchange[7][timinggroup][_svst][0])*0.25*global.globalspeed+610,
				_yup=(global.playtime-global.svchange[7][timinggroup][_svst][0]-global.svchange[7][timinggroup][_svst][2])*0.25*global.globalspeed+610;
				draw_rectangle(553,_yup,573,_ydo,false);
				draw_rectangle(547,_ydo-12,580,_ydo,false);
				scr_drawline(_ydo,_yup,600,527,global.svchange[7][timinggroup][_svst][3]);
				draw_set_colour(#00cc00);
				scr_drawline(_ydo,_yup,527,600,global.svchange[7][timinggroup][_svst][3]);
				draw_set_colour(#ffffff);
				draw_set_alpha(1);
				if (!keyboard_check(vk_control)){
				draw_text_transformed(563,_ydo,string(global.svchange[7][timinggroup][_svst][1]),0.22,0.22,0);
				}
				else{draw_text_transformed(563,_ydo,scr_easename(global.svchange[7][timinggroup][_svst][3]),0.22,0.22,0);}
				if(_canread==1){
					if(_ydo<mouse_y+30&&_ydo>mouse_y-30&&round((mouse_x-257)/102)==3&&!keyboard_check(vk_tab)){
						draw_set_colour(c_green);
						draw_set_alpha(0.5);
						draw_rectangle(225+306,_ydo-18,288+306,_ydo+6,0)
						_canread=2;
						draw_set_colour(c_white);
						draw_set_alpha(1);
					}
				}
			}
		}
		if(array_length(global.svchange[8])>=timinggroup){
			var _svst=scr_svget(global.svchange[8][timinggroup],global.playtime-10000,0);
			var _svet=scr_svget(global.svchange[8][timinggroup],global.playtime+5000,0);
			
			while(_svst<_svet){
				_svst++;
				draw_set_colour(#66ffff);
				if (array_get_index(global.svchoose[8],_svst)==-1) draw_set_alpha(0.65);
				var _ydo=(global.playtime-global.svchange[8][timinggroup][_svst][0])*0.25*global.globalspeed+610,
				_yup=(global.playtime-global.svchange[8][timinggroup][_svst][0]-global.svchange[8][timinggroup][_svst][2])*0.25*global.globalspeed+610;
				draw_rectangle(655,_yup,675,_ydo,false);
				draw_rectangle(649,_ydo-12,682,_ydo,false);
				scr_drawline(_ydo,_yup,702,629,global.svchange[8][timinggroup][_svst][3]);
				draw_set_colour(#00aaff);
				scr_drawline(_ydo,_yup,629,702,global.svchange[8][timinggroup][_svst][3]);
				draw_set_colour(#ffffff);
				draw_set_alpha(1);
				if (!keyboard_check(vk_control)){
				draw_text_transformed(665,_ydo,string(global.svchange[8][timinggroup][_svst][1]),0.22,0.22,0);
				}
				else{draw_text_transformed(665,_ydo,scr_easename(global.svchange[8][timinggroup][_svst][3]),0.22,0.22,0);}
				if(_canread==1){
					if(_ydo<mouse_y+30&&_ydo>mouse_y-30&&round((mouse_x-257)/102)==4&&!keyboard_check(vk_tab)){
						draw_set_colour(c_green);
						draw_set_alpha(0.5);
						draw_rectangle(225+408,_ydo-18,288+408,_ydo+6,0)
						_canread=2;
						draw_set_colour(c_white);
						draw_set_alpha(1);
					}
				}
			}
		}
		
		if(array_length(global.svchange[0])>=timinggroup){
			var _svst=scr_svget(global.svchange[0][timinggroup],global.playtime-10000,0);
			var _svet=scr_svget(global.svchange[0][timinggroup],global.playtime+5000,0);
			
			while(_svst<_svet){
				_svst++;
				draw_set_colour(#777777);
				if (array_get_index(global.svchoose[0],_svst)==-1) draw_set_alpha(0.65);
				var _y=(global.playtime-global.svchange[0][timinggroup][_svst][0])*0.25*global.globalspeed+610;
				draw_rectangle(209,_y-12,308,_y,false);
				draw_set_colour(#ffffff);
				draw_set_alpha(1);
				draw_text_transformed(257,_y,string(global.svchange[0][timinggroup][_svst][1]),0.22,0.22,0);
				if(_canread==1){
					if(_y<mouse_y+30&&_y>mouse_y-30&&round((mouse_x-257)/102)==0){
						draw_set_colour(c_green);
						draw_set_alpha(0.5);
						draw_rectangle(205,_y-18,308,_y+6,0)
						_canread=2;
						draw_set_colour(c_white);
						draw_set_alpha(1);
					}
				}
			}
		}
		draw_set_color(c_black);
		draw_text_transformed(259,642,"SV",0.3,0.3,0);
		draw_text_transformed(361,642,"SF",0.3,0.3,0);
		draw_text_transformed(463,642,"Y",0.3,0.3,0);
		draw_text_transformed(565,642,"YG",0.3,0.3,0);
		draw_text_transformed(667,642,"X",0.3,0.3,0);
		draw_text_transformed(361,682,string(scr_svset(global.svchange[1][timinggroup],global.svchange[5][timinggroup],global.playtime)),0.22,0.22,0);
		draw_text_transformed(463,682,string(scr_svset(global.svchange[2][timinggroup],global.svchange[6][timinggroup],global.playtime)),0.22,0.22,0);
		draw_text_transformed(565,682,string(scr_svset(global.svchange[3][timinggroup],global.svchange[7][timinggroup],global.playtime)),0.22,0.22,0);
		draw_text_transformed(667,682,string(scr_svset(global.svchange[4][timinggroup],global.svchange[8][timinggroup],global.playtime)),0.22,0.22,0);
		draw_set_color(c_white);
		draw_text_transformed(257,640,"SV",0.3,0.3,0);
		draw_text_transformed(359,640,"SF",0.3,0.3,0);
		draw_text_transformed(461,640,"Y",0.3,0.3,0);
		draw_text_transformed(563,640,"YG",0.3,0.3,0);
		draw_text_transformed(665,640,"X",0.3,0.3,0);
		draw_text_transformed(359,680,string(scr_svset(global.svchange[1][timinggroup],global.svchange[5][timinggroup],global.playtime)),0.22,0.22,0);
		draw_text_transformed(461,680,string(scr_svset(global.svchange[2][timinggroup],global.svchange[6][timinggroup],global.playtime)),0.22,0.22,0);
		draw_text_transformed(563,680,string(scr_svset(global.svchange[3][timinggroup],global.svchange[7][timinggroup],global.playtime)),0.22,0.22,0);
		draw_text_transformed(665,680,string(scr_svset(global.svchange[4][timinggroup],global.svchange[8][timinggroup],global.playtime)),0.22,0.22,0);
		draw_text_transformed(257,680,string(scr_svset(global.svchange[0][timinggroup],[],global.playtime)),0.22,0.22,0);
	}
	if (mouse_x>209&&mouse_x<715&&_canread!=2){
		draw_set_alpha(0.5);
		if (global.barline>0&&(608+(global.playtime-global.bpmlist[0][0])*global.globalspeed*0.25)>mouse_y){
				
			draw_rectangle(
				257+102*round((mouse_x-257)/102)-48
				,608+(global.playtime-scr_barfind(global.barlist,global.mousetime))*global.globalspeed*0.25-12
				,257+102*round((mouse_x-257)/102)+47
				,608+(global.playtime-scr_barfind(global.barlist,global.mousetime))*global.globalspeed*0.25
				,false);
		}
		else if((608+(global.playtime)*global.globalspeed*0.25)>mouse_y&&mouse_y<608){
			draw_rectangle(
				257+102*round((mouse_x-257)/102)-48
				,mouse_y-12
				,257+102*round((mouse_x-257)/102)+47
				,mouse_y
				,false);
		}
		draw_set_alpha(1);
		}
	}
	else{
		draw_set_halign(fa_middle);
		draw_set_color(c_white);
		draw_text_transformed(512,330,"选择一个时间组以编辑",0.3,0.3,0);
	}
	
	if (holdinput>=0){
		
		var _x=257+102*holdtrack,
			yup=608+(global.playtime-holdinput)*global.globalspeed*0.25,
			ydo;
		if (global.barline>0&&holdinput<scr_barfind(global.barlist,global.mousetime)){
			ydo=608+(global.playtime-scr_barfind(global.barlist,global.mousetime))*global.globalspeed*0.25;
		}
		else if(global.barline==0&&holdinput<global.mousetime){
			ydo=608+(global.playtime-global.mousetime)*global.globalspeed*0.25;
		}
		else ydo=yup;
		draw_set_color(c_white);
		draw_set_alpha(0.5);
		draw_rectangle(_x-10,ydo,_x+10,yup,false);
		draw_set_alpha(1);
	}
	
	if (square_y!=-1){
		draw_set_alpha(0.4);
		gpu_set_depth(-9999);
		draw_set_color(#00cc00);
		draw_rectangle(mouse_x,mouse_y,square_x*102+257,((global.playtime-square_y)*global.globalspeed/4)+608,0);
	}
	if(mouse_x>64&&mouse_x<224&&mouse_y>640&&mouse_y<704){
		gpu_set_depth(-10101);
		if(help==0){
			draw_set_alpha(1);
			draw_set_color(#ffff00);
			draw_set_halign(fa_left);
			draw_text_transformed(32,600,"变速/特效教程\n单击鼠标左键切换下一页",0.23,0.23,0);
		}
		else if(help==1){
			draw_set_color(#000000);
			draw_set_alpha(0.7);
			draw_rectangle(220,0,800,1000,0);
			draw_set_alpha(1);
			draw_set_color(#ffffff);
			draw_set_halign(fa_middle);
			draw_text_transformed(144,600,"变速效果",0.3,0.3,0);
			draw_set_color(#ffffff);
			draw_set_halign(fa_left);
			draw_text_transformed(300,350,"SV(灰)：区间变速\n\nSF(红)：全局变速\n\nY(黄)：调整Y坐标，Y>0时note判定位置在判定线下方\n受SF影响\n\nYG(绿)：调整Y坐标，Y>0时note判定位置在判定线下方\n不受SF影响\n\nX(蓝)：调整X坐标，Y>0时note判定位置在原始位置右侧",0.3,0.3,0);
		}
		else if(help==2){
			draw_set_color(#000000);
			draw_set_alpha(0.7);
			draw_rectangle(250,0,800,1000,0);
			draw_set_alpha(1);
			draw_set_color(#ffffff);
			draw_set_halign(fa_left);
			draw_text_transformed(320,350,"Q：放置瞬时变速\n按住W：放置持续变速\n\n鼠标左键：选择\n鼠标左键+Ctrl：多选\n鼠标左键+Shift：框选\n\n鼠标右键：删除变速\nDeleat：删除选中的变速\n\nCtrl+P：复制当前选中的SF到SV",0.3,0.3,0);
			draw_set_halign(fa_middle);
			draw_text_transformed(144,600,"按键操作",0.3,0.3,0);
			draw_set_halign(fa_right);
		}
		else if(help==3){
			draw_set_color(#000000);
			draw_set_alpha(0.7);
			draw_rectangle(220,0,800,1000,0);
			draw_set_alpha(1);
			draw_set_color(#ffffff);
			draw_set_halign(fa_middle);
			draw_text_transformed(144,600,"未完成内容",0.3,0.3,0);
			draw_set_color(#ffffff);
			draw_set_halign(fa_left);
			draw_text_transformed(300,350,"以下内容暂时无法在制谱器内编辑，需要手动编辑谱面文件：\n\nE：谱面结束时间\n格式：E,timing\n\nT：显示文字\n格式：T,timing,text,time,x1,y1,gy1,sx1,sy1,a1,r1,x2,y2,gy2,sx2,sy2,a2,\n             r2,xease,yease,gyease,sxease,syease,aease,rease,color,depth\n\nR：重置随机组\n格式：R,timing,randomgroup\n注：在相同timing下，note会比变速早4000ms加载",0.3,0.3,0);
		}
		else if(help==4){
			draw_set_color(#000000);
			draw_set_alpha(0.7);
			draw_rectangle(220,0,800,1000,0);
			draw_set_alpha(1);
			draw_set_color(#ffffff);
			draw_set_halign(fa_middle);
			draw_text_transformed(144,600,"未完成内容",0.3,0.3,0);
			draw_set_color(#ffffff);
			draw_set_halign(fa_left);
			draw_text_transformed(300,350,"以下内容暂时无法在制谱器内编辑，需要手动编辑谱面文件：\n\nCA/CAN：chromatic特效\n格式：CAN,timing,a,type\nCA,timing,a,duration,type,ease\n\nCB/CBN：bloom特效\n格式：CBN,timing,a,type\nCB,timing,a,duration,type,ease",0.3,0.3,0);
		}
	}
	gpu_set_depth(_depth);
	
}

else if (designview==2){
	gpu_set_depth(8266);
	draw_sprite(spr_backban,0,640,608);
	gpu_set_depth(_depth);
	var _q=global.list;
	var _xy=[0,0];
	draw_set_alpha(1);
	while(_q>=0&&real(global.chartread[_q][1])>global.playtime+4000){
		_q--;
	}
	while(_q>=0){
		if real(global.chartread[_q][1])<global.playtime-20000 break;
		
		_xy=scr_chartxyset(real(global.chartread[_q][1]),real(global.chartread[_q][2]),real(global.chartread[_q][3]));
		
		if(global.chartread[_q][0]=="T"){
			if(real(global.chartread[_q][1])>global.playtime){
				draw_sprite(spr_tap,0,
					_xy[0],
					_xy[1]
				);
			}
		}
		else if(global.chartread[_q][0]=="RT"){
			if(real(global.chartread[_q][1])>global.playtime){
				var _track=global.chartread[_q][4+floor(global.rand[real(global.chartread[_q][2])]*(array_length(global.chartread[_q])-4))];
				if (_track!="none"){
					var _xy2=scr_chartxyset(real(global.chartread[_q][1]),real(_track),real(global.chartread[_q][3]));
					draw_sprite(spr_tap,0,
						_xy2[0],
						_xy2[1]
					);
				}
			}	
		}
		else if(global.chartread[_q][0]=="BP"){
			if(real(global.chartread[_q][1])>global.playtime){
				draw_sprite(spr_bumper,0,
					_xy[0],
					_xy[1]
				);
			}
		}
		else if(global.chartread[_q][0]=="TP"){
			if(real(global.chartread[_q][1])>global.playtime){
				draw_sprite(spr_triper,0,
					_xy[0],
					_xy[1]
				);
			}
		}
		else if(global.chartread[_q][0]=="QP"){
			if(real(global.chartread[_q][1])>global.playtime){
				draw_sprite(spr_quader,0,
					_xy[0],
					_xy[1]
				);
			}
		}
		else if(global.chartread[_q][0]=="F"){
			if(real(global.chartread[_q][1])>global.playtime){
				draw_sprite_ext(spr_fakekey,0,
					_xy[0],
					_xy[1],
					1,1,0,real(global.chartread[_q][4]),draw_get_alpha()
				);
			}
		}
		else if(global.chartread[_q][0]=="RF"){
			if(real(global.chartread[_q][1])>global.playtime){
				
				var _track=global.chartread[_q][5+floor(global.rand[real(global.chartread[_q][2])]*(array_length(global.chartread[_q])-5))];
				if (_track!="none"){
					var _xy2=scr_chartxyset(real(global.chartread[_q][1]),real(_track),real(global.chartread[_q][3]));
					draw_sprite_ext(spr_fakekey,0,
						_xy2[0],
						_xy2[1],
						1,1,0,real(global.chartread[_q][4]),draw_get_alpha()
					);
				}
			}	
		}
		else if(global.chartread[_q][0]=="B"){
			if(real(global.chartread[_q][1])>global.playtime){
				gpu_set_depth(5500);
				draw_set_colour(#999999);
				draw_rectangle(_xy[0]-48,_xy[1]+6,_xy[0]+48,_xy[1],false);
				gpu_set_depth(_depth);
			}
		}
		else if(global.chartread[_q][0]=="N"){
			if(real(global.chartread[_q][1])>global.playtime){
				draw_sprite(spr_endtap,0,
					_xy[0],
					_xy[1]
				);
			}
		}
		else if(global.chartread[_q][0]=="M"){
			if(real(global.chartread[_q][1])>global.playtime){
				draw_sprite(spr_misstap,0,
					_xy[0],
					_xy[1]
				);
			}
		}
		else if(global.chartread[_q][0]=="RM"){
			if(real(global.chartread[_q][1])>global.playtime){
				var _track=global.chartread[_q][4+floor(global.rand[real(global.chartread[_q][2])]*(array_length(global.chartread[_q])-4))];
				if (_track!="none"){
					var _xy2=scr_chartxyset(real(global.chartread[_q][1]),real(_track),real(global.chartread[_q][3]));
					draw_sprite(spr_misstap,0,
						_xy2[0],
						_xy2[1]
					);
				}
			}	
		}
		else if(global.chartread[_q][0]=="A"){
			if(real(global.chartread[_q][1])>global.playtime){
				draw_sprite(spr_touchap,0,
					_xy[0],
					_xy[1]
				);
			}
		}
		else if(global.chartread[_q][0]=="RA"){
			if(real(global.chartread[_q][1])>global.playtime){
				var _track=global.chartread[_q][4+floor(global.rand[real(global.chartread[_q][2])]*(array_length(global.chartread[_q])-4))];
				if (_track!="none"){
					var _xy2=scr_chartxyset(real(global.chartread[_q][1]),real(_track),real(global.chartread[_q][3]));
					draw_sprite(spr_touchap,0,
						_xy2[0],
						_xy2[1]
					);
				}
			}	
		}
		else if(global.chartread[_q][0]=="L"){
			var _yup=scr_chartxyset(real(global.chartread[_q][4]),real(global.chartread[_q][2]),real(global.chartread[_q][3]))[1];
			
			if(real(global.chartread[_q][1])>global.playtime){
				gpu_set_depth(6000);
				draw_sprite_pos(spr_lnkey,0,_xy[0]-36,_yup,_xy[0]+36,_yup,_xy[0]+36,_xy[1],_xy[0]-36,_xy[1],0.5);
				gpu_set_depth(_depth);
			}
			else if(real(global.chartread[_q][4])>global.playtime){
				gpu_set_depth(6000);
				draw_sprite_pos(spr_lnkey,0,_xy[0]-36,_yup,_xy[0]+36,_yup,_xy[0]+36,608,_xy[0]-36,608,0.5);
				gpu_set_depth(_depth);
			}
		}
		else if(global.chartread[_q][0]=="LN"){
			var _yup=scr_chartxyset(real(global.chartread[_q][4]),real(global.chartread[_q][2]),real(global.chartread[_q][3]))[1];
			if(real(global.chartread[_q][1])>global.playtime){
				draw_sprite(spr_tap,0,_xy[0],_xy[1]);
				gpu_set_depth(6000);
				draw_sprite_pos(spr_lnkey,0,_xy[0]-36,_yup,_xy[0]+36,_yup,_xy[0]+36,_xy[1],_xy[0]-36,_xy[1],0.7);
				gpu_set_depth(_depth);
			}
			else if(real(global.chartread[_q][4])>global.playtime){
				gpu_set_depth(6000);
				draw_sprite_pos(spr_lnkey,0,_xy[0]-36,_yup,_xy[0]+36,_yup,_xy[0]+36,608,_xy[0]-36,608,0.7);
				gpu_set_depth(_depth);
			}
		}
		else if(global.chartread[_q][0]=="P"){
			if(real(global.chartread[_q][1])>global.playtime){
				gpu_set_depth(8000-((real(global.chartread[_q][1])-global.playtime)/10));
				if global.chartread[_q][4]=="1" draw_set_colour(#440000);
				if global.chartread[_q][4]=="2" draw_set_colour(#442200);
				if global.chartread[_q][4]=="3" draw_set_colour(#003300);
				if global.chartread[_q][4]=="4" draw_set_colour(#000044);
				draw_rectangle(_xy[0]-48,-1,_xy[0]+47,608-power(real(global.chartread[_q][1])-global.playtime,3)/19000000,false);

				draw_set_alpha((real(global.chartread[_q][1])-global.playtime)/4000)
				if global.chartread[_q][4]=="1" draw_set_colour(#ff0000);
				if global.chartread[_q][4]=="2" draw_set_colour(#ff9900);
				if global.chartread[_q][4]=="3" draw_set_colour(#00cc00);
				if global.chartread[_q][4]=="4" draw_set_colour(#0000ff);
				draw_rectangle(_xy[0]-48,-1,_xy[0]-42,608-power(real(global.chartread[_q][1])-global.playtime,3)/19000000,false);
				draw_rectangle(_xy[0]+41,-1,_xy[0]+47,608-power(real(global.chartread[_q][1])-global.playtime,3)/19000000,false);
				draw_set_alpha(1)
				if global.chartread[_q][4]=="1" draw_set_colour(#ff0000);
				if global.chartread[_q][4]=="2" draw_set_colour(#ffff00);
				if global.chartread[_q][4]=="3" draw_set_colour(#00ff00);
				if global.chartread[_q][4]=="4" draw_set_colour(#0000ff);
				gpu_set_depth(-4000);
				draw_rectangle(_xy[0]-48,_xy[1]-12,_xy[0]+47,_xy[1],false);
				gpu_set_depth(_depth);
				draw_set_colour(c_white);
			}
		}
		
		if (keyboard_check(vk_control)){
				gpu_set_depth(-5000);
				draw_set_color(c_white);
				draw_text_transformed(
				_xy[0],
				_xy[1],
				string(global.chartread[_q][3]),0.22,0.22,0);
				gpu_set_depth(_depth);
			}
		
		
	_q--;
	
	}
	
	if(timinggroup>=0){
		_xy=scr_chartxyset(global.playtime,2.5,timinggroup);
		
		gpu_set_depth(7000);
		draw_sprite(spr_timinggroupban,0,_xy[0],_xy[1]);
	}
	gpu_set_depth(_depth);
}
	
else if (designview==-1){
	gpu_set_depth(8266);
	draw_sprite(spr_backban,0,512,608);
	gpu_set_depth(8000);
	for (var i = 0; i < array_length(global.barlist); i++) {
		draw_set_color(global.barlist[i][1]);
		var bar_time = global.barlist[i][0];
		
		var _y=(global.playtime-bar_time)*0.25*global.globalspeed+610
		if global.barlist[i][1]==#FC3636 
			draw_line_width(298,_y,724,_y,5);
		else if global.barlist[i][1]==#B36CFF||global.barlist[i][1]==#0093FD
			draw_line_width(298,_y,724,_y,4);
		else if global.barlist[i][1]==#F2C94C||global.barlist[i][1]==#F758A4
			draw_line_width(298,_y,724,_y,3);
		else draw_line_width(298,_y,724,_y,2);
				
		draw_set_halign(fa_left);
		if real(global.barlist[i][2])>=1
		draw_text_transformed(730,_y,"  "+string(global.barlist[i][2]),0.23,0.23,0);
		else if real(global.barlist[i][2])>0 
		draw_text_transformed(730,_y," "+string(global.barlist[i][2])+"/"+string(global.barline),0.2,0.2,0);
	}
	
	
	
	gpu_set_depth(_depth);
	var _q=global.list,_canread=0;
	while(_q>=0){
		
		if(_canread==1) _canread=0;
		if real(global.chartread[_q][1])<global.playtime-20000 break;
		
		if(timinggroup<0||global.chartread[_q][3]==timinggroup){
			if array_get_index(global.choose,_q)==-1 draw_set_alpha(0.65);
			else draw_set_alpha(1);
			if(global.chartread[_q][0]=="RT"){
				draw_sprite(spr_tap,0,
					359+102*real(global.chartread[_q][2]),
					608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25
				);
				if(_canread==0) _canread=1;
			}
			else if(global.chartread[_q][0]=="RF"){
				
				draw_sprite_ext(spr_fakekey,0,
					359+102*real(global.chartread[_q][2]),
					608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25,
					1,1,0,real(global.chartread[_q][4]),draw_get_alpha()
				);
				if(_canread==0) _canread=1;
			}
			else if(global.chartread[_q][0]=="RM"){
				draw_sprite(spr_misstap,0,
					359+102*real(global.chartread[_q][2]),
					608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25
				);
				if(_canread==0) _canread=1;
			}
			else if(global.chartread[_q][0]=="RA"){
				draw_sprite(spr_touchap,0,
					359+102*real(global.chartread[_q][2]),
					608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25
				);
				if(_canread==0) _canread=1;
			}
			
			if (keyboard_check(vk_control)){
				gpu_set_depth(-5000);
				draw_set_color(c_white);
				draw_text_transformed(
				359+102*real(global.chartread[_q][2]),
				608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25,
				string(global.chartread[_q][3]),0.22,0.22,0);
				gpu_set_depth(_depth);
			}
			if(_canread==1){
				if(608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25<mouse_y+30
				&&608+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25>mouse_y-10
				&&round((mouse_x-359)/102-real(global.chartread[_q][2]))==0){
					draw_set_colour(c_green);
					draw_set_alpha(0.5);
					draw_rectangle(
					307+102*real(global.chartread[_q][2]),
					578+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25,
					409+102*real(global.chartread[_q][2]),
					618+(global.playtime-real(global.chartread[_q][1]))*global.globalspeed*0.25,0)
					_canread=2;
					draw_set_colour(c_white);
					draw_set_alpha(1);
				}
			}
		}
		_q--;
	
	}

	if (mouse_x>311&&mouse_x<715&&_canread!=2){
		draw_set_alpha(0.5);
		if (global.barline>0&&(608+(global.playtime-global.bpmlist[0][0])*global.globalspeed*0.25)>mouse_y){
			draw_sprite(spr_fakekey,0,
					359+102*round((mouse_x-359)/102),
					608+(global.playtime-scr_barfind(global.barlist,global.mousetime))*global.globalspeed*0.25
				);

		}
		else if((608+(global.playtime)*global.globalspeed*0.25)>mouse_y&&mouse_y<608){
			draw_sprite(spr_fakekey,0,
					359+102*round((mouse_x-359)/102),
					mouse_y
				);
		}
		draw_set_alpha(1);
	}
	if (square_y!=-1){
		draw_set_alpha(0.4);
		gpu_set_depth(-9999);
		draw_set_color(#00cc00);
		draw_rectangle(mouse_x,mouse_y,square_x*102+257,((global.playtime-square_y)*global.globalspeed/4)+608,0);
	}
	if(mouse_x>64&&mouse_x<224&&mouse_y>640&&mouse_y<704){
		gpu_set_depth(-10101);
		if(help==0){
			draw_set_alpha(1);
			draw_set_color(#ffff00);
			draw_set_halign(fa_left);
			draw_text_transformed(32,600,"随机note教程\n单击鼠标左键切换下一页",0.23,0.23,0);
		}
		else if(help==1){
			draw_set_color(#000000);
			draw_set_alpha(0.7);
			draw_rectangle(250,0,800,1000,0);
			draw_set_alpha(1);
			draw_set_color(#ffffff);
			draw_set_halign(fa_left);
			draw_set_color(#00ff00);
			draw_set_alpha(0.3);
			draw_rectangle(206,0,308,1000,0);
			draw_set_color(#ffffff);
			draw_set_alpha(1);
			draw_text_transformed(320,120,"←在note视图中，\"none\"表示为轨道左侧位置",0.23,0.23,0);
			draw_text_transformed(320,420,"Q：放置随机Tap\nW：放置随机Drag\nE：放置随机地雷\nR：放置随机假note\n\n游戏在启动时会生成4个0~1之间的小数，分别对应随机组 0~3\n这4个数值在游戏过程中固定不变\n\n当轨道为\"none\"时，将不会生成该note\n在轨道输入框内输入\"none\"或\"n\"以设置为\"none\"",0.3,0.3,0);
			draw_set_halign(fa_middle);
			draw_set_color(c_gray);
			draw_sprite_ext(spr_btn,0,864,208,4,1,0,c_gray,1);
			draw_text_transformed(864,208,"轨道",0.23,0.23,0);
			draw_set_color(#ffffff);
			draw_text_transformed(144,600,"随机note",0.3,0.3,0);
			draw_set_halign(fa_right);
			draw_text_transformed(784,192,"轨道：定义了当随机数的值落在不同区间时\nnote会出现在哪个轨道→",0.23,0.23,0);
			draw_text_transformed(1200,352,"随机项：决定了将区间[0,1)划分为多少份↑",0.23,0.23,0);
			draw_text_transformed(784,688,"调整随机组数值以查看不同随机数下的谱面→",0.23,0.23,0);
		}
		else if(help==2){
			draw_set_color(#000000);
			draw_set_alpha(0.7);
			draw_rectangle(220,0,800,1000,0);
			draw_set_alpha(1);
			draw_set_color(#ffffff);
			draw_set_halign(fa_middle);
			draw_text_transformed(144,600,"未完成内容",0.3,0.3,0);
			draw_set_color(#ffffff);
			draw_set_halign(fa_left);
			draw_text_transformed(300,350,"以下内容暂时无法在制谱器内编辑，需要手动编辑谱面文件：\n\nR：重置随机组\n格式：R,timing,randomgroup",0.3,0.3,0);
		}
	}
}

else if (designview==-2){
	gpu_set_depth(8266);
	draw_sprite(spr_backban,0,512,608);
	gpu_set_depth(8000);
	for (var i = 0; i < array_length(global.barlist); i++) {
		draw_set_color(global.barlist[i][1]);
		var bar_time = global.barlist[i][0];
		
		var _y=(global.playtime-bar_time)*0.25*global.globalspeed+610
		if global.barlist[i][1]==#FC3636 
			draw_line_width(298,_y,724,_y,5);
		else if global.barlist[i][1]==#B36CFF||global.barlist[i][1]==#0093FD
			draw_line_width(298,_y,724,_y,4);
		else if global.barlist[i][1]==#F2C94C||global.barlist[i][1]==#F758A4
			draw_line_width(298,_y,724,_y,3);
		else draw_line_width(298,_y,724,_y,2);
				
		draw_set_halign(fa_left);
		if real(global.barlist[i][2])>=1
		draw_text_transformed(730,_y,"  "+string(global.barlist[i][2]),0.23,0.23,0);
		else if real(global.barlist[i][2])>0 
		draw_text_transformed(730,_y," "+string(global.barlist[i][2])+"/"+string(global.barline),0.2,0.2,0);
	}
	draw_set_halign(fa_middle);
	draw_set_colour(c_white)
	gpu_set_depth(_depth);
	var _q=array_length(global.bpmlist)-1,_canread=0;
	if(mouse_x>311&&mouse_x<715) _canread=1;
	while(_q>=0){
		if real(global.bpmlist[_q][0])<global.playtime break;
		
		if(array_length(global.choose)!=0&&global.choose[0]=_q){
			draw_set_alpha(1);
		}
		else{
			draw_set_alpha(0.65);
		}
		
		draw_sprite(spr_triper,0,
			410,
			608+(global.playtime-real(global.bpmlist[_q][0]))*global.globalspeed*0.25
		);
		draw_set_alpha(1);
		draw_text_transformed(511,
		602+(global.playtime-real(global.bpmlist[_q][0]))*global.globalspeed*0.25
		,"  "+string(global.bpmlist[_q][1]),0.27,0.27,0);
		if(_canread==1){
			if(608+(global.playtime-real(global.bpmlist[_q][0]))*global.globalspeed*0.25<mouse_y+30
			&&608+(global.playtime-real(global.bpmlist[_q][0]))*global.globalspeed*0.25>mouse_y-10){
				draw_set_colour(c_green);
				draw_set_alpha(0.5);
				draw_rectangle(
				356,
				578+(global.playtime-real(global.bpmlist[_q][0]))*global.globalspeed*0.25,
				668,
				618+(global.playtime-real(global.bpmlist[_q][0]))*global.globalspeed*0.25,0)
				_canread=2;
				draw_set_colour(c_white);
				draw_set_alpha(1);
			}
		}
		
		_q--;
	
	}
	draw_set_alpha(1);
	if (mouse_x>311&&mouse_x<715&&_canread!=2){
		draw_set_alpha(0.5);
		if (global.barline>0&&(608+(global.playtime-global.bpmlist[0][0])*global.globalspeed*0.25)>mouse_y){
			draw_sprite(spr_quader,0,359,
					608+(global.playtime-scr_barfind(global.barlist,global.mousetime))*global.globalspeed*0.25
				);
		}
		else if((608+(global.playtime)*global.globalspeed*0.25)>mouse_y&&mouse_y<608){
			draw_sprite(spr_quader,0,359,mouse_y);
		}
		draw_set_alpha(1);
	}
	if (square_y!=-1){
		draw_set_alpha(0.4);
		gpu_set_depth(-9999);
		draw_set_color(#00cc00);
		draw_rectangle(mouse_x,mouse_y,square_x*102+257,((global.playtime-square_y)*global.globalspeed/4)+608,0);
	}
	if(mouse_x>64&&mouse_x<224&&mouse_y>640&&mouse_y<704){
		gpu_set_depth(-10101);
		if(help==0){
			draw_set_alpha(1);
			draw_set_color(#ffff00);
			draw_set_halign(fa_left);
			draw_text_transformed(32,600,"BPM教程\n我觉得不需要所以不写了",0.23,0.23,0);
		}
	}
}

if (keyboard_check(vk_escape)){
	gpu_set_depth(-9876);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_rectangle(350,218,930,518,false);
	draw_set_color(c_black);
	draw_rectangle(358,226,922,510,false);
	draw_set_color(c_white);
	draw_set_halign(fa_middle);
	draw_text_transformed(640,275,"退出编辑？",0.35,0.35,0);
	draw_text_transformed(640,345,"保存并退出   ESC+S",0.30,0.30,0);
	draw_text_transformed(640,375,"(谱面将保存至"+string(global.level)+".pqc，原谱面将保存至"+string(global.level)+"_Backup.pqc)",0.22,0.22,0);
	draw_text_transformed(640,420,"不保存退出   ESC+N",0.30,0.30,0);
	draw_text_transformed(640,450,"(谱面将保存至"+string(global.level)+"_Backup.pqc)",0.22,0.22,0);
	gpu_set_depth(_depth);
}

gpu_set_depth(_depth);
gpu_set_zwriteenable(_zwrite);
gpu_set_ztestenable(_ztest);