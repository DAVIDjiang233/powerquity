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
else{
	msg = get_integer_async("请输入数值", "");
}

