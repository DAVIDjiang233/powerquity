
if (ctrl_chartdesign.designview!=1) exit;

var _a=0,_b=0;
for(var _i=0;_i<5;_i++){
	if (array_length(global.svchoose[_i])!=0) {_a=1;}
}
for(var _i=5;_i<9;_i++){
	if (array_length(global.svchoose[_i])!=0) {_b=1;}
}
if ((_a==0&&_b==0)||(_a==1&&type>=3)) exit;

global.mouseonbtn=0;
mouseonbtn=0;