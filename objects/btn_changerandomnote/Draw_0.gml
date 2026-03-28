if (ctrl_chartdesign.designview!=-1) exit;

draw_set_alpha(1);
draw_self();
draw_set_colour(c_white)
draw_set_halign(fa_middle);

if (array_length(global.choose)==0){
	draw_text_transformed(x,y,"随机项:"+string(randomnumber),0.22,0.22,0);
}
else{
	var _j=4;
	if(global.chartread[global.choose[0]][0]=="RF") _j=5;
	var _ran=array_length(global.chartread[global.choose[0]])-_j;
	var _vist=0;
	for(var _i=1;_i<array_length(global.choose);_i++){
		_j=4;
		if(global.chartread[global.choose[_i]][0]=="RF") _j=5;
		if(array_length(global.chartread[global.choose[_i]])-_j!=_ran){
			_vist=1;
			break;
		}
	}
	if(_vist==0){
		draw_text_transformed(x,y,"随机项:"+string(_ran),0.22,0.22,0);
	}
	else{
		draw_text_transformed(x,y,"随机项",0.22,0.22,0);
	}
}