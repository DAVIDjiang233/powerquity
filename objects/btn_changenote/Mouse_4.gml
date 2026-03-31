if (array_length(global.choose)==0) exit;
if (ctrl_chartdesign.designview>0) exit;
if (ctrl_chartdesign.designview<-1) exit;

if type==4{
	var _notetype=global.chartread[global.choose[0]][0];
	for (var i=1;i<array_length(global.choose);i++){
		if (global.chartread[global.choose[0]][0]!=global.chartread[global.choose[i]][0]){
		_notetype=1;
		break;
		}
	}
	if (_notetype=="L"||_notetype=="LN"){
		msg = get_integer_async("请输入数值", "");
	}
	else if(_notetype=="RF"||_notetype=="F"){
		msg = get_integer_async("请输入色号", "");
	}
	else if(_notetype=="P"){
		var _vist=0;
		for (var i=1;i<array_length(global.choose);i++){
			if (real(global.chartread[global.choose[0]][4])!=real(global.chartread[global.choose[i]][4])){
			_vist=1;
			break;
			}
		}
		if (_vist==0){
			if (real(global.chartread[global.choose[0]][4])==4){
				for (var i=0;i<array_length(global.choose);i++){
					global.chartread[global.choose[i]][4]=1;
				}
			}
			else{
				global.chartread[global.choose[0]][4]=real(global.chartread[global.choose[0]][4])+1
				for (var i=1;i<array_length(global.choose);i++){
					global.chartread[global.choose[i]][4]=global.chartread[global.choose[0]][4];
				}
			}
		}
		else{
			for (var i=0;i<array_length(global.choose);i++){
					global.chartread[global.choose[i]][4]=1;
			}
		}
	}
}
else if type==5{
	var _notetype=0;
	for (var i=0;i<array_length(global.choose);i++){
		_notetype=global.chartread[global.choose[i]][0];
		if(_notetype!="RT"&&_notetype!="RM"&&_notetype!="RA"&&_notetype!="RF"){
		_notetype=1;
		break;
		}
	}
	if (_notetype!=1){
		msg = get_integer_async("请输入数值", "");
	}
}
else{
	msg = get_integer_async("请输入数值", "");
}