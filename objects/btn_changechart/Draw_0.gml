
draw_set_alpha(1);
draw_self();
draw_set_colour(c_white)
draw_set_halign(fa_middle);

var _text="";
if type==0{
	_text="曲名";
}
else if type==1{
	_text="曲师";
}
else if type==2{
	_text="BPM显示";
}
else if type==3{
	_text="谱师";
}
else if type==4{
	_text="难度名";
}
draw_text_transformed(x,y,_text,0.22,0.22,0);