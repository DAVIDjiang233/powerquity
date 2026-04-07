if (array_length(global.choose)!=0) exit;
if (ctrl_chartdesign.designview<-1) exit;
//if (ctrl_chartdesign.designview==2) exit;
draw_set_alpha(1);
draw_self();
draw_set_colour(c_white)
draw_set_halign(fa_middle);

if (ctrl_chartdesign.timinggroup==-1){
	draw_text_transformed(x,y,"时间组:All",0.22,0.22,0);
}
else{
	draw_text_transformed(x,y,"时间组:"+string(ctrl_chartdesign.timinggroup),0.22,0.22,0);
}
