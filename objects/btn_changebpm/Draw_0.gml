draw_set_alpha(1);
draw_self();
draw_set_colour(c_white)
draw_set_halign(fa_middle);
if type==0{
	draw_text_transformed(x,y,"BPM:"+string(global.bpmlist[0][1]),0.22,0.22,0);
}
if type==1{
	draw_text_transformed(x,y,"延迟:"+string(global.bpmlist[0][0]),0.22,0.22,0);
}