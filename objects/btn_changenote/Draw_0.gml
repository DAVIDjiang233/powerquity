if (array_length(global.choose)==0) exit;
if (ctrl_chartdesign.designview>0) exit;
var _notetype=global.chartread[global.choose[0]][0];
if type==4{
	
	for (var i=1;i<array_length(global.choose);i++){
		if global.chartread[global.choose[0]][0]!=global.chartread[global.choose[i]][0]{
		_notetype=1;
		break;
		}
	}
	if (_notetype!="L"&&_notetype!="LN"&&_notetype!="F"&&_notetype!="P"&&_notetype!="RF") exit;
}
else if type==5{
	for (var i=0;i<array_length(global.choose);i++){
		_notetype=global.chartread[global.choose[i]][0];
		if(_notetype!="RT"&&_notetype!="RM"&&_notetype!="RA"&&_notetype!="RF"){
			_notetype=1;
			break;
		}
	}
	if (_notetype==1) exit;
}


draw_set_alpha(1);
draw_self();
draw_set_colour(c_white)
draw_set_halign(fa_middle);

var _text="";
if type==1{
	_text="时间";
}
else if type==2{
	_text="轨道";
}
else if type==3{
	_text="时间组";
}
else if type==4{
	if(_notetype=="L"||_notetype=="LN"){
		_text="时间";
	}
	else if(_notetype=="F"||_notetype=="RF"){
		_text="颜色";
	}
	else if(_notetype=="P"){
		_text="轨道";
	}
}
else if type==5{
	_text="随机组";
}

var _vist=0;
var _typebase=0;
if(type==2&&(global.chartread[global.choose[0]][0]=="RT"||global.chartread[global.choose[0]][0]=="RM"||global.chartread[global.choose[0]][0]=="RA")){
	_typebase=global.chartread[global.choose[0]][4+floor(global.rand[real(global.chartread[global.choose[0]][2])]*(array_length(global.chartread[global.choose[0]])-4))];
}
else if(type==2&&global.chartread[global.choose[0]][0]=="RF"){
	_typebase=global.chartread[global.choose[0]][5+floor(global.rand[real(global.chartread[global.choose[0]][2])]*(array_length(global.chartread[global.choose[0]])-5))];
}
else if (type==5){
	_typebase=global.chartread[global.choose[0]][2];
}
else{
	_typebase=global.chartread[global.choose[0]][type];
}
for (var i=1;i<array_length(global.choose);i++){
	var _typenow;
	if(type==2&&(global.chartread[global.choose[i]][0]=="RT"||global.chartread[global.choose[i]][0]=="RM"||global.chartread[global.choose[i]][0]=="RA")){
		_typenow=global.chartread[global.choose[i]][4+floor(global.rand[real(global.chartread[global.choose[i]][2])]*(array_length(global.chartread[global.choose[i]])-4))];
	}
	else if(type==2&&global.chartread[global.choose[i]][0]=="RF"){
		_typenow=global.chartread[global.choose[i]][5+floor(global.rand[real(global.chartread[global.choose[i]][2])]*(array_length(global.chartread[global.choose[i]])-5))];
	}
	else if (type==5){
		_typenow=global.chartread[global.choose[i]][2];
	}
	else{
		_typenow=global.chartread[global.choose[i]][type];
	}
	if _typebase!=_typenow{
	_vist=1;
	break;
	}
}
if(scr_stringtreal(_typebase)>=1){
	_typebase=+scr_floatostring(_typebase);
}
if (_vist==0){
	_text=_text+":"+string(_typebase);
}
if(string_width(_text)>550){
	draw_text_transformed(x,y,_text,121/string_width(_text),121/string_width(_text),0);
}
else{
	draw_text_transformed(x,y,_text,0.22,0.22,0);
}
