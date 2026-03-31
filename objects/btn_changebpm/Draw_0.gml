if (array_length(global.choose)==0) exit;
if (ctrl_chartdesign.designview!=-2) exit;

draw_set_alpha(1);
draw_self();
draw_set_colour(c_white)
draw_set_halign(fa_middle);

var _text="";
if type==0{
	_text="时间:"+string(global.bpmlist[global.choose[0]][0]);
}
else if type==1{
	_text="BPM:"+string(global.bpmlist[global.choose[0]][1]);
}

if(string_width(_text)>550){
	draw_text_transformed(x,y,_text,121/string_width(_text),121/string_width(_text),0);
}
else{
	draw_text_transformed(x,y,_text,0.22,0.22,0);
}
