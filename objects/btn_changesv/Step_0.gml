if (ctrl_chartdesign.designview!=1) exit;
if (type=4){
	ease=-1;
	for(var _i=5;_i<9;_i++){
		for(var _j=0;_j<array_length(global.svchoose[_i]);_j++){
			if(typeof(global.svchange[_i][ctrl_chartdesign.timinggroup][global.svchoose[_i][_j]][3])=="array"){
				ease=-2;
				break;
			}
			if(ease==-1){
				ease=real(global.svchange[_i][ctrl_chartdesign.timinggroup][global.svchoose[_i][_j]][3]);
			}
			else if(ease!=real(global.svchange[_i][ctrl_chartdesign.timinggroup][global.svchoose[_i][_j]][3])){
				ease=-2;
				break;
			}
		}
	}
	if(ease<-1) {ease=-1;}
}