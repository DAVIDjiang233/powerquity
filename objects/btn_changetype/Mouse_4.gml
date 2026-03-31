if (ctrl_chartdesign.designview>0) exit;
if (ctrl_chartdesign.designview<-1) exit;
if (ctrl_chartdesign.designview==-1&&array_length(global.choose)==0) exit;

if type==0{
	if (array_length(global.choose)==0){
		if(keyboard_check(vk_shift)){
			if (global.notetype[0]=="T") global.notetype[0]="B";
			else if (global.notetype[0]=="N") global.notetype[0]="T";
			else if (global.notetype[0]=="A") global.notetype[0]="N";
			else if (global.notetype[0]=="M") global.notetype[0]="A";
			else if (global.notetype[0]=="QP") global.notetype[0]="TP";
			else if (global.notetype[0]=="TP") global.notetype[0]="BP";
			else if (global.notetype[0]=="BP") global.notetype[0]="M";
			else if (global.notetype[0]=="B") global.notetype[0]="QP";
		}
		else{
				if (global.notetype[0]=="T") global.notetype[0]="N";
				else if (global.notetype[0]=="N") global.notetype[0]="A";
				else if (global.notetype[0]=="A") global.notetype[0]="M";
				else if (global.notetype[0]=="M") global.notetype[0]="BP";
				else if (global.notetype[0]=="BP") global.notetype[0]="TP";
				else if (global.notetype[0]=="TP") global.notetype[0]="QP";
				else if (global.notetype[0]=="QP") global.notetype[0]="B";
				else if (global.notetype[0]=="B") global.notetype[0]="T";
			}
	}
	else{
		var _vist=0;
		for (var i=1;i<array_length(global.choose);i++){
			if global.chartread[global.choose[0]][0]!=global.chartread[global.choose[i]][0]{
			_vist=1;
			break;
			}
		}
		if _vist==0{
			var _q="wcsndm";
			if(keyboard_check(vk_shift)){
				if (global.chartread[global.choose[0]][0]=="T") _q="B"
				else if (global.chartread[global.choose[0]][0]=="N") _q="T";
				else if (global.chartread[global.choose[0]][0]=="A") _q="N";
				else if (global.chartread[global.choose[0]][0]=="M") _q="A";
				else if (global.chartread[global.choose[0]][0]=="QP") _q="TP";
				else if (global.chartread[global.choose[0]][0]=="TP") _q="BP";
				else if (global.chartread[global.choose[0]][0]=="BP") _q="M";
				else if (global.chartread[global.choose[0]][0]=="B") _q="QP";
				else if (global.chartread[global.choose[0]][0]=="LN") _q="L";
				else if (global.chartread[global.choose[0]][0]=="L") _q="LN";
			
				else if (global.chartread[global.choose[0]][0]=="RT") _q="RA";
				else if (global.chartread[global.choose[0]][0]=="RM") _q="RT";
				else if (global.chartread[global.choose[0]][0]=="RA") _q="RM";
			}
			else{
				if (global.chartread[global.choose[0]][0]=="T") _q="N"
				else if (global.chartread[global.choose[0]][0]=="N") _q="A";
				else if (global.chartread[global.choose[0]][0]=="A") _q="M";
				else if (global.chartread[global.choose[0]][0]=="M") _q="BP";
				else if (global.chartread[global.choose[0]][0]=="BP") _q="TP";
				else if (global.chartread[global.choose[0]][0]=="TP") _q="QP";
				else if (global.chartread[global.choose[0]][0]=="QP") _q="B";
				else if (global.chartread[global.choose[0]][0]=="B") _q="T";
				else if (global.chartread[global.choose[0]][0]=="LN") _q="L";
				else if (global.chartread[global.choose[0]][0]=="L") _q="LN";
			
				else if (global.chartread[global.choose[0]][0]=="RT") _q="RM";
				else if (global.chartread[global.choose[0]][0]=="RM") _q="RA";
				else if (global.chartread[global.choose[0]][0]=="RA") _q="RT";
			}
			
			if(_q!="wcsndm"){
				for (var i=0;i<array_length(global.choose);i++){
					global.chartread[global.choose[i]][0]=_q;
				}
			}
		}
		else {
			for (var i=0;i<array_length(global.choose);i++){
				if(global.chartread[global.choose[i]][0]!="RT"&&global.chartread[global.choose[i]][0]!="RM"&&global.chartread[global.choose[i]][0]!="RA"&&global.chartread[global.choose[i]][0]!="RF"){
					global.chartread[global.choose[i]][0]="T";
					while(array_length(global.chartread[global.choose[i]])>4){
						array_delete(global.chartread[global.choose[i]],4,1);
					}
				}
			}
		}
		scr_cancelchart();
	}
}