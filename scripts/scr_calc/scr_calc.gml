function scr_calc(_rpnall,_x){
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
		else if(_rpn[_i]=="ly"){
			array_push(_cal,global.playskin[71]);
			_i++;
		}
		else if(_rpn[_i]=="lx1"){
			array_push(_cal,global.playskin[69]);
			_i++;
		} 
		else if(_rpn[_i]=="lx2"){
			array_push(_cal,global.playskin[70]);
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
			if(_cal[array_length(_cal)-1]==0) return 0;
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
			else return 0;
		}
		else if(_rpn[_i]=="pow"){
			if(array_length(_cal)<2) return 0;
			if(_cal[array_length(_cal)-2]>0
			||(_cal[array_length(_cal)-2]==0&&array_last(_cal)>=0)
			||(_cal[array_length(_cal)-2]<0&&(round(array_last(_cal))==array_last(_cal)))
			){
				_cal[array_length(_cal)-2]=power(_cal[array_length(_cal)-2],array_last(_cal));
				array_pop(_cal);
				_i++;
			}
			else return 0;
		}
		else if(_rpn[_i]=="abs"){
			_cal[array_length(_cal)-1]=abs(array_last(_cal));
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
		else{
			array_push(_cal,_rpn[_i]);
			_i++;
		}
	}
	//show_debug_message(_cal);
	return _cal[0];
}