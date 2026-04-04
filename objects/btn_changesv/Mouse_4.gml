if (ctrl_chartdesign.designview!=1) exit;
var _a=0,_b=0;
for(var _i=0;_i<5;_i++){
	if (array_length(global.svchoose[_i])!=0) {_a=1;}
}
for(var _i=5;_i<9;_i++){
	if (array_length(global.svchoose[_i])!=0) {_b=1;}
}
if ((_a==0&&_b==0)||(_a==1&&type>=3)) exit;

if(type==4){
	if(keyboard_check(vk_control)){
		var _easex=0;
		for(var _i=5;_i<9;_i++){
			for(var _j=0;_j<array_length(global.svchoose[_i]);_j++){
				if(typeof(global.svchange[_i][ctrl_chartdesign.timinggroup][global.svchoose[_i][_j]][3])=="array"){
					_easex=scr_nibl2str(global.svchange[_i][ctrl_chartdesign.timinggroup][global.svchoose[_i][_j]][3]);
					break;
				}
				else{
					_easex=real(global.svchange[_i][ctrl_chartdesign.timinggroup][global.svchoose[_i][_j]][3]);
					if _easex==0{
						_easex="x";
					}
					else if _easex==1{
						_easex="1-(x-1)^2";
					}
					else if _easex==2{
						_easex="x^2";
					}
					else if _easex==4{
						_easex="sin(((x-1)*pi)/2)+1";
					}
					else if _easex==3{
						_easex="sin((x*pi)/2)";
					}
					else if _easex==5{
						_easex="(1-(x-1)^2)^0.5";
					}
					else if _easex==6{
						_easex="1-(1-x^2)^0.5";
					}
					else if _easex==7{
						_easex="1+(x-1)^3";
					}
					else if _easex==8{
						_easex="x^3";
					}
					break;
				}
			}
		}
		msg = get_integer_async("请输入函数", _easex);
	}
	else {
		if(!keyboard_check(vk_shift)){
			ease++;
			if (ease>8) ease=0;
		}
		else{
			ease--;
			if (ease<-1.1) ease=0;
			if (ease<-0.1) ease=8;
		}
		scr_tgsetnum(ctrl_chartdesign.timinggroup,ease,3);
		scr_cancelsv();
	}
}
else{
	msg = get_integer_async("请输入数值", "");
}

