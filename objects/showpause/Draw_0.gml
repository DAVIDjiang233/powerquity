if ctrl_playgame.gamepause==1{
	draw_set_colour(c_black);
	draw_set_alpha(0.4);
	draw_rectangle(0,0,2222,2222,0);

	draw_set_colour(c_white);
	draw_set_alpha(1);
	
	if(global.mirror!=1){
		draw_text_transformed(640, 160, "暂停",1,1,0);
		draw_text_transformed(640, 290, chr(global.pressext[1])+" / Enter: 继续",0.4,0.4,0);
		draw_text_transformed(640, 350, "ESC: 退出",0.4,0.4,0);
		draw_text_transformed(640, 410, chr(global.pressext[0])+": 重玩",0.4,0.4,0);
	}
	else{
		draw_text_transformed(640, 160, "暂停",-1,1,0);
		draw_text_transformed(640, 290, chr(global.pressext[1])+" / Enter: 继续",-0.4,0.4,0);
		draw_text_transformed(640, 350, "ESC: 退出",-0.4,0.4,0);
		draw_text_transformed(640, 410, chr(global.pressext[0])+": 重玩",-0.4,0.4,0);
	}
}