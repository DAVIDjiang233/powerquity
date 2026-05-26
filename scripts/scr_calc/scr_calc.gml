function scr_calc(_rpnall,_x,error_result=0){
	var _cal=[];
	var _num=0;
	while(_num<array_length(_rpnall[1])&&_rpnall[1][_num]<_x){
		_num++;
	}
	var _rpn=_rpnall[0][_num];
	//show_debug_message(_rpnall);
	var _i=0;
	while(array_length(_rpn)>_i){
		if(_rpn[_i]=="x"){
			array_push(_cal,_x);
			_i++;
		}
		else if(_rpn[_i]=="spd"){
			array_push(_cal,global.globalspeed);
			_i++;
		}
		else if(_rpn[_i]=="+"){
			_cal[array_length(_cal)-2]+=array_pop(_cal);
			_i++;
		}
		else if(_rpn[_i]=="-"){
			_cal[array_length(_cal)-2]-=array_pop(_cal);
			_i++;
		}
		else if(_rpn[_i]=="*"){
			_cal[array_length(_cal)-2]*=array_pop(_cal);
			_i++;
		}
		else if(_rpn[_i]=="/"){
			if(_cal[array_length(_cal)-1]==0) return error_result;
			_cal[array_length(_cal)-2]/=array_pop(_cal);
			_i++;
		}
		else if(_rpn[_i]=="^"){
			if(_cal[array_length(_cal)-2]>0
			||(_cal[array_length(_cal)-2]==0&&array_last(_cal)>=0)
			||(_cal[array_length(_cal)-2]<0&&(round(array_last(_cal))==array_last(_cal)))
			){
				_cal[array_length(_cal)-2]=power(_cal[array_length(_cal)-2],array_last(_cal));
				array_pop(_cal);
				_i++;
			}
			else return error_result;
		}
		else if(_rpn[_i]=="="){
			_cal[array_length(_cal)-2]-=array_pop(_cal);
			if(array_last(_cal)==0){
				_cal[array_length(_cal)-1]=1;
			}
			else{
				_cal[array_length(_cal)-1]=0;
			}
			_i++;
		}
		else if(_rpn[_i]=="pow"){
			if(array_length(_cal)<2) return error_result;
			if(_cal[array_length(_cal)-2]>0
			||(_cal[array_length(_cal)-2]==0&&array_last(_cal)>=0)
			||(_cal[array_length(_cal)-2]<0&&(round(array_last(_cal))==array_last(_cal)))
			){
				_cal[array_length(_cal)-2]=power(_cal[array_length(_cal)-2],array_last(_cal));
				array_pop(_cal);
				_i++;
			}
			else return error_result;
		}
		else if(_rpn[_i]=="min"){
			if(array_length(_cal)<2) return error_result;
			if(_cal[array_length(_cal)-2]>_cal[array_length(_cal)-1]){
				_cal[array_length(_cal)-2]=_cal[array_length(_cal)-1];
			}
			array_pop(_cal);
			_i++;
		}
		else if(_rpn[_i]=="max"){
			if(array_length(_cal)<2) return error_result;
			if(_cal[array_length(_cal)-2]<_cal[array_length(_cal)-1]){
				_cal[array_length(_cal)-2]=_cal[array_length(_cal)-1];
			}
			array_pop(_cal);
			_i++;
		}
		else if(_rpn[_i]=="abs"){
			_cal[array_length(_cal)-1]=abs(array_last(_cal));
			_i++;
		}
		else if(_rpn[_i]=="flo"){
			_cal[array_length(_cal)-1]=floor(array_last(_cal));
			_i++;
		}
		else if(_rpn[_i]=="sin"){
			_cal[array_length(_cal)-1]=sin(array_last(_cal));
			_i++;
		}
		else if(_rpn[_i]=="cos"){
			_cal[array_length(_cal)-1]=cos(array_last(_cal));
			_i++;
		}
		else if(_rpn[_i]=="skn"){
			_cal[array_length(_cal)-1]=floor(_cal[array_length(_cal)-1]);
			if(_cal[array_length(_cal)-1]<array_length(global.skinnumber)&&_cal[array_length(_cal)-1]>=0){
				_cal[array_length(_cal)-1]=
				global.skinnumber[_cal[array_length(_cal)-1]];
				_i++;
			}
			else return error_result;
		}
		else if(_rpn[_i]=="spr"){
			_cal[array_length(_cal)-2]=floor(_cal[array_length(_cal)-2]);
			if(_cal[array_length(_cal)-2]<=-1){
				_cal[array_length(_cal)-2]=global.lastnum[0]-_cal[array_length(_cal)-2];
			}
			if(_cal[array_length(_cal)-2]<array_length(global.playskin)
			&&global.playskin[_cal[array_length(_cal)-2]]!=0){
				if(_cal[array_length(_cal)-1]<0.5){
					_cal[array_length(_cal)-2]=sprite_get_width(global.playskin[_cal[array_length(_cal)-2]]);
				}
				else{
					_cal[array_length(_cal)-2]=sprite_get_height(global.playskin[_cal[array_length(_cal)-2]]);
				}
				array_pop(_cal);
				_i++;
			}
			else return error_result;
		}
		else if(_rpn[_i]=="txt"){
			_cal[array_length(_cal)-1]=floor(_cal[array_length(_cal)-1]);
			if(_cal[array_length(_cal)-1]<=-1){
				_cal[array_length(_cal)-1]=global.lastnum[1]-_cal[array_length(_cal)-1];
			}
			if(_cal[array_length(_cal)-1]<array_length(global.playtext)
			&&global.playtext[_cal[array_length(_cal)-1]]!=0){
				var _font=draw_get_font();
				draw_set_font(global.fontall[global.playtext[_cal[array_length(_cal)-1]][9]]);
				_cal[array_length(_cal)-1]=
				string_width(string_ext(global.playtext[_cal[array_length(_cal)-1]][4],global.textlist))
				/font_get_size(global.fontall[global.playtext[_cal[array_length(_cal)-1]][9]])*72;
				_i++;
				draw_set_font(_font);
			}
			else return error_result;
		}
		else{
			array_push(_cal,_rpn[_i]);
			_i++;
		}
	}
	//show_debug_message(_cal);
	return _cal[0];
}