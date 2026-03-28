draw_set_alpha(1);
draw_self();
draw_set_colour(c_white)
draw_set_halign(fa_middle);

if (ctrl_chartdesign.designview==-1){
	draw_text_transformed(x,y,"视图:随机",0.22,0.22,0);
}
if (ctrl_chartdesign.designview==0){
	draw_text_transformed(x,y,"视图:note",0.22,0.22,0);
}
else if (ctrl_chartdesign.designview==1){
	draw_text_transformed(x,y,"视图:effect",0.22,0.22,0);
}
else if (ctrl_chartdesign.designview==2){
	draw_text_transformed(x,y,"视图:预览",0.22,0.22,0);
}
