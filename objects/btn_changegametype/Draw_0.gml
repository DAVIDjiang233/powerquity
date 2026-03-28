draw_set_alpha(1);
draw_self();
draw_set_colour(c_white)
draw_set_halign(fa_middle);

if (ctrl_chartdesign.gametype==1){
	draw_text_transformed(x,y,"游戏模式:\nMania",0.22,0.22,0);
}
else if (ctrl_chartdesign.gametype==2){
	draw_text_transformed(x,y,"游戏模式:\nQWERTYUIOP",0.22,0.22,0);
}