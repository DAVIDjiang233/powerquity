draw_set_alpha(1);
draw_self();
draw_set_colour(c_white)
draw_set_halign(fa_middle);
if type==0{
	scr_draw_text(x,y,"流速:"+string(global.globalspeed),0.22,0.22,0);
}
if type==1{
	scr_draw_text(x,y,"小节线:"+string(global.barline),0.22,0.22,0);
}