if(mouseonbtn==0) exit;
if (ctrl_chartdesign.designview!=0) exit;

if type==0{
	if (array_length(global.choose)==0){

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