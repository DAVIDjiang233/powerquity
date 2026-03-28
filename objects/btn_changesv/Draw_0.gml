
if (ctrl_chartdesign.designview!=1) exit;

var _a=0,_b=0;
for(var _i=0;_i<5;_i++){
	if (array_length(global.svchoose[_i])!=0) {_a=1;}
}
for(var _i=5;_i<9;_i++){
	if (array_length(global.svchoose[_i])!=0) {_b=1;}
}
if ((_a==0&&_b==0)||(_a==1&&type>=3)) exit;

draw_set_alpha(1);
draw_self();
draw_set_colour(c_white)
draw_set_halign(fa_middle);

var _text="";
if type==1{
	var _num="q";
	for(var _i=0;_i<9;_i++){
		for(var _j=0;_j<array_length(global.svchoose[_i]);_j++){
			if(_num=="q"){
				_num=real(global.svchange[_i][ctrl_chartdesign.timinggroup][global.svchoose[_i][_j]][0]);
			}
			else if(_num!=real(global.svchange[_i][ctrl_chartdesign.timinggroup][global.svchoose[_i][_j]][0])){
				_num="w";
				break;
			}
		}
	}
	if(scr_stringtreal(_num)==1){
		_text="时间:"+scr_floatostring(_num);
	}
	else _text="时间";
}
else if type==2{
	
	var _num="q";
	for(var _i=0;_i<9;_i++){
		for(var _j=0;_j<array_length(global.svchoose[_i]);_j++){
			if(_num=="q"){
				_num=real(global.svchange[_i][ctrl_chartdesign.timinggroup][global.svchoose[_i][_j]][1]);
			}
			else if(_num!=real(global.svchange[_i][ctrl_chartdesign.timinggroup][global.svchoose[_i][_j]][1])){
				_num="w";
				break;
			}
		}
	}
	if(scr_stringtreal(_num)==1){
		_text="数值:"+scr_floatostring(_num);
	}
	else{
		_text="数值";
	}
}
else if type==3{
	var _num="q";
	for(var _i=5;_i<9;_i++){
		for(var _j=0;_j<array_length(global.svchoose[_i]);_j++){
			if(_num=="q"){
				_num=real(global.svchange[_i][ctrl_chartdesign.timinggroup][global.svchoose[_i][_j]][2]);
			}
			else if(_num!=real(global.svchange[_i][ctrl_chartdesign.timinggroup][global.svchoose[_i][_j]][2])){
				_num="w";
				break;
			}
		}
	}
	if(scr_stringtreal(_num)==1){
		_text="持续:"+scr_floatostring(_num);
	}
	else{
		_text="持续时间";
	}
}
else if type==4{
	if(ease==-1){
		_text="缓动";
	}
	else{
		_text="缓动:"+scr_easename(ease);
	}
}
if(string_width(_text)>550){
	draw_text_transformed(x,y,_text,121/string_width(_text),121/string_width(_text),0);
}
else{
	draw_text_transformed(x,y,_text,0.22,0.22,0);
}
