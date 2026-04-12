if (array_length(global.choose)==0) exit;
if (ctrl_chartdesign.designview>0) exit;
if (ctrl_chartdesign.designview<-1) exit;

if type==4{
	var _notetype=global.chartread[global.choose[0]][0];
	if (_notetype!="F"&&_notetype!="P"&&_notetype!="RF"){
		_notetype="timing"
		for (var i=0;i<array_length(global.choose);i++){
			if(global.chartread[global.choose[i]][0]!="T"&&
			global.chartread[global.choose[i]][0]!="BP"&&
			global.chartread[global.choose[i]][0]!="TP"&&
			global.chartread[global.choose[i]][0]!="QP"&&
			global.chartread[global.choose[i]][0]!="LN"){
				exit;
			}
		}
	}
	else{
		for (var i=1;i<array_length(global.choose);i++){
			if global.chartread[global.choose[0]][0]!=global.chartread[global.choose[i]][0]{
				exit;
			}
		}
	}
	if(_notetype=="RF"||_notetype=="F"){
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
		scr_cancelchart();
	}
	else if (_notetype=="timing"){
		var _vist=0;
		var _num=0
		if(global.chartread[global.choose[0]][0]=="LN"){
			_num=real(global.chartread[global.choose[0]][5]);
		}
		else{
			_num=real(global.chartread[global.choose[0]][4]);
		}
		for (var i=1;i<array_length(global.choose);i++){
			if(global.chartread[global.choose[i]][0]=="LN"){
				if (_num!=real(global.chartread[global.choose[i]][5])){
					_vist=1;
					break;
				}
			}
			else{
				if (_num!=real(global.chartread[global.choose[i]][4])){
					_vist=1;
					break;
				}
			}
		}
		if (_vist==0&&_num==1){
			for (var i=0;i<array_length(global.choose);i++){
				if(global.chartread[global.choose[i]][0]=="LN"){
					global.chartread[global.choose[i]][5]=0;
				}
				else global.chartread[global.choose[i]][4]=0;
			}
		}
		else{
			for (var i=0;i<array_length(global.choose);i++){
				if(global.chartread[global.choose[i]][0]=="LN"){
					global.chartread[global.choose[i]][5]=1;
				}
				else global.chartread[global.choose[i]][4]=1;
			}
		}
		scr_cancelchart();
	}
}
else if type==5{
	var _notetype=global.chartread[global.choose[0]][0];
	if (_notetype=="RT"||_notetype=="RM"||_notetype=="RA"||_notetype=="RF"){
		for (var i=0;i<array_length(global.choose);i++){
			if(global.chartread[global.choose[i]][0]!="RT"
			&&global.chartread[global.choose[i]][0]!="RM"
			&&global.chartread[global.choose[i]][0]!="RA"
			&&global.chartread[global.choose[i]][0]!="RF"){
				exit;
			}
		}
	}
	else if(_notetype=="LN"||_notetype=="L"){
		for (var i=0;i<array_length(global.choose);i++){
			if(global.chartread[global.choose[i]][0]!="LN"
			&&global.chartread[global.choose[i]][0]!="L"){
				exit;
			}
		}
	}
	else exit;
	msg = get_integer_async("请输入数值", "");
}
else{
	msg = get_integer_async("请输入数值", "");
}