function scr_nibl(_string){
	var _rpn=[],_sym=[];
	var _rpnall=[[],[]];
	var _strnum=0;
	var _lastnum=0;
	var _numtemp="";
	while(_strnum<string_length(_string)){
		//处理数值
		if(
		(ord(string_char_at(_string,_strnum+1))<=ord(9)
		&&ord(string_char_at(_string,_strnum+1))>=ord(0))
		||string_char_at(_string,_strnum+1)=="."
		){
			var _dot=0;
			while(_strnum<string_length(_string)&&(
			(ord(string_char_at(_string,_strnum+1))<=ord(9)
			&&ord(string_char_at(_string,_strnum+1))>=ord(0))
			||string_char_at(_string,_strnum+1)==".")
			){
				if(string_char_at(_string,_strnum+1)=="."){
					if(_dot==0) _dot=1;
					else return[[[0]],[]];
				}
				_numtemp+=string_char_at(_string,_strnum+1);
				_strnum++;
			}
			array_push(_rpn,real(_numtemp));
			if(_lastnum==1){
				array_push(_rpn,"*");
			}
			_lastnum=1;
			_numtemp="";
		}
		//处理x
		else if(string_char_at(_string,_strnum+1)=="x"){
			array_push(_rpn,"x");
			if(_lastnum==1){
				array_push(_rpn,"*");
			}
			_lastnum=1;
			_strnum++;
		}
		//处理-+
		else if(string_char_at(_string,_strnum+1)=="+"||string_char_at(_string,_strnum+1)=="-"){
			if(_lastnum=1){
				while(array_length(_sym)>0&&
				(_sym[array_length(_sym)-1]=="+"||_sym[array_length(_sym)-1]=="-"
				||_sym[array_length(_sym)-1]=="*"||_sym[array_length(_sym)-1]=="/"
				||_sym[array_length(_sym)-1]=="^")
				){
					array_push(_rpn,_sym[array_length(_sym)-1]);
					array_pop(_sym);
				}
				array_push(_sym,string_char_at(_string,_strnum+1));
				_lastnum=0;
				_strnum++;
			}
			else{
				if(_numtemp=""){
					_numtemp=string_char_at(_string,_strnum+1);
					_strnum++;
				}
				else return[[[0]],[]];
			}
		}
		//处理*/
		else if(string_char_at(_string,_strnum+1)=="*"||string_char_at(_string,_strnum+1)=="/"){
			if(_lastnum=1){
				while(array_length(_sym)>0&&
				(_sym[array_length(_sym)-1]=="*"||_sym[array_length(_sym)-1]=="/"
				||_sym[array_length(_sym)-1]=="^")
				){
					array_push(_rpn,_sym[array_length(_sym)-1]);
					array_pop(_sym);
				}
				array_push(_sym,string_char_at(_string,_strnum+1));
				_lastnum=0;
				_strnum++;
			}
			else return[[[0]],[]];
		}
		//处理^
		else if(string_char_at(_string,_strnum+1)=="^"){
			if(_lastnum=1){
				array_push(_sym,string_char_at(_string,_strnum+1));
				_lastnum=0;
				_strnum++;
			}
			else return[[[0]],[]];
		}
		//处理(
		else if(string_char_at(_string,_strnum+1)=="("){
			if(_lastnum=1){
				array_push(_sym,"*");
				_lastnum=0;
			}
			array_push(_sym,"(");
			_strnum++;
		}
		//处理abs
		else if(string_char_at(_string,_strnum+1)=="a"){
			if(string_char_at(_string,_strnum+2)=="b"&&string_char_at(_string,_strnum+3)=="s"
			&&string_char_at(_string,_strnum+4)=="("){
				if(_lastnum=1){
					array_push(_sym,"*");
					_lastnum=0;
				}
				array_push(_sym,"abs");
				_strnum+=3;
			}
			_strnum++;
		}
		//处理cos
		else if(string_char_at(_string,_strnum+1)=="c"){
			if(string_char_at(_string,_strnum+2)=="o"&&string_char_at(_string,_strnum+3)=="s"
			&&string_char_at(_string,_strnum+4)=="("){
				if(_lastnum=1){
					array_push(_sym,"*");
					_lastnum=0;
				}
				array_push(_sym,"cos");
				_strnum+=3;
			}
			_strnum++;
		}
		//处理pow pi
		else if(string_char_at(_string,_strnum+1)=="p"){
			if(string_char_at(_string,_strnum+2)=="o"&&string_char_at(_string,_strnum+3)=="w"
			&&string_char_at(_string,_strnum+4)=="("){
				if(_lastnum=1){
					array_push(_sym,"*");
					_lastnum=0;
				}
				array_push(_sym,"pow");
				_strnum+=3;
			}
			else{
				array_push(_rpn,pi);
				if(_lastnum==1){
					array_push(_rpn,"*");
				}
				_lastnum=1;
			}
			_strnum++;
		}
		//处理sin
		else if(string_char_at(_string,_strnum+1)=="s"){
			if(string_char_at(_string,_strnum+2)=="i"&&string_char_at(_string,_strnum+3)=="n"
			&&string_char_at(_string,_strnum+4)=="("){
				if(_lastnum=1){
					array_push(_sym,"*");
					_lastnum=0;
				}
				array_push(_sym,"sin");
				_strnum+=3;
			}
			_strnum++;
		}
		//处理)
		else if(string_char_at(_string,_strnum+1)==")"){
			if(_lastnum=1){
				while(array_length(_sym)>0&&
				_sym[array_length(_sym)-1]!="("&&_sym[array_length(_sym)-1]!="abs"
				&&_sym[array_length(_sym)-1]!="sin"&&_sym[array_length(_sym)-1]!="cos"
				&&_sym[array_length(_sym)-1]!="pow"
				){
					array_push(_rpn,_sym[array_length(_sym)-1]);
					array_pop(_sym);
				}
				if(array_length(_sym)>0){
					if(_sym[array_length(_sym)-1]!="("){
						array_push(_rpn,_sym[array_length(_sym)-1]);
					}
					array_pop(_sym);
				}
				else return[[[0]],[]];
			}
			else return[[[0]],[]];
			_strnum++;
		}
		//处理,
		else if(string_char_at(_string,_strnum+1)==","){
			if(_lastnum=1){
				while(array_length(_sym)>0&&
				_sym[array_length(_sym)-1]!="("&&_sym[array_length(_sym)-1]!="abs"
				&&_sym[array_length(_sym)-1]!="sin"&&_sym[array_length(_sym)-1]!="cos"
				&&_sym[array_length(_sym)-1]!="pow"
				){
					array_push(_rpn,_sym[array_length(_sym)-1]);
					array_pop(_sym);
				}
				if(array_length(_sym)==0){
					if(array_length(_rpnall[0])==array_length(_rpnall[1])){
						array_push(_rpnall[0],_rpn);
					}
					else{
						array_push(_rpnall[1],scr_calc([[_rpn],[]],0));
					}
					_rpn=[];
				}
				_lastnum=0;
			}
			else return[[[0]],[]];
			_strnum++;
		}
		//处理;
		else if(string_char_at(_string,_strnum+1)==";"){
			if(_lastnum=1){
				while(array_length(_sym)>0){
					if(_sym[array_length(_sym)-1]=="("&&_sym[array_length(_sym)-1]!="abs"
					&&_sym[array_length(_sym)-1]!="sin"&&_sym[array_length(_sym)-1]!="cos"
					&&_sym[array_length(_sym)-1]!="pow"){
						return[[[0]],[]];
					}
					array_push(_rpn,_sym[array_length(_sym)-1]);
					array_pop(_sym);
				}
				if(array_length(_rpnall[0])==array_length(_rpnall[1])){
					array_push(_rpnall[0],_rpn);
				}
				else{
					array_push(_rpnall[1],scr_calc([[_rpn],[]],0));
				}
				_rpn=[];
				_lastnum=0;
			}
			else return[[[0]],[]];
			_strnum++;
		}
			
		else _strnum++;
	}
	if(_lastnum==0) return[[[0]],[]];
	while(array_length(_sym)>0){
		if(_sym[array_length(_sym)-1]=="(") return[[[0]],[]];
		if(_sym[array_length(_sym)-1]=="abs") return[[[0]],[]];
		if(_sym[array_length(_sym)-1]=="cos") return[[[0]],[]];
		if(_sym[array_length(_sym)-1]=="sin") return[[[0]],[]];
		if(_sym[array_length(_sym)-1]=="pow") return[[[0]],[]];
		else{
			array_push(_rpn,_sym[array_length(_sym)-1]);
			array_pop(_sym);
		}
	}
	array_push(_rpnall[0],_rpn);
	show_debug_message(_rpnall);
	return _rpnall;
}