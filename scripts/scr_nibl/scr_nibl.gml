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
		else if(string_char_at(_string,_strnum+1)=="="){
			if(_lastnum=1){
				while(array_length(_sym)>0&&
				(_sym[array_length(_sym)-1]=="+"||_sym[array_length(_sym)-1]=="-"
				||_sym[array_length(_sym)-1]=="*"||_sym[array_length(_sym)-1]=="/"
				||_sym[array_length(_sym)-1]=="^"||_sym[array_length(_sym)-1]=="=")
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
			if(string_pos_ext("bs(", _string, _strnum+1)==_strnum+2){
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
			if(string_pos_ext("os(", _string, _strnum+1)==_strnum+2){
				if(_lastnum=1){
					array_push(_sym,"*");
					_lastnum=0;
				}
				array_push(_sym,"cos");
				_strnum+=3;
			}
			_strnum++;
		}
		//处理text
		else if(string_char_at(_string,_strnum+1)=="t"){
			if(string_pos_ext("ext(", _string, _strnum+1)==_strnum+2){
				if(_lastnum=1){
					array_push(_sym,"*");
					_lastnum=0;
				}
				array_push(_sym,"txt");
				_strnum+=4;
			}
			_strnum++;
		}
		//处理floor
		else if(string_char_at(_string,_strnum+1)=="f"){
			if(string_pos_ext("loor(", _string, _strnum+1)==_strnum+2){
				if(_lastnum=1){
					array_push(_sym,"*");
					_lastnum=0;
				}
				array_push(_sym,"flo");
				_strnum+=5;
			}
			_strnum++;
		}
		//处理min max
		else if(string_char_at(_string,_strnum+1)=="m"){
			if(string_pos_ext("in(", _string, _strnum+1)==_strnum+2){
				if(_lastnum=1){
					array_push(_sym,"*");
					_lastnum=0;
				}
				array_push(_sym,"min");
				_strnum+=3;
			}
			else if(string_pos_ext("ax(", _string, _strnum+1)==_strnum+2){
				if(_lastnum=1){
					array_push(_sym,"*");
					_lastnum=0;
				}
				array_push(_sym,"max");
				_strnum+=3;
			}
			_strnum++;
		}
		//处理pow pi
		else if(string_char_at(_string,_strnum+1)=="p"){
			if(string_pos_ext("ow(", _string, _strnum+1)==_strnum+2){
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
		//处理sin spd sknum
		else if(string_char_at(_string,_strnum+1)=="s"){
			if(string_pos_ext("in(", _string, _strnum+1)==_strnum+2){
				if(_lastnum=1){
					array_push(_sym,"*");
					_lastnum=0;
				}
				array_push(_sym,"sin");
				_strnum+=3;
			}
			else if(string_pos_ext("pr(", _string, _strnum+1)==_strnum+2){
				if(_lastnum=1){
					array_push(_sym,"*");
					_lastnum=0;
				}
				array_push(_sym,"spr");
				_strnum+=3;
			}
			else if(string_pos_ext("knum(", _string, _strnum+1)==_strnum+2){
				if(_lastnum=1){
					array_push(_sym,"*");
					_lastnum=0;
				}
				array_push(_sym,"skn");
				_strnum+=5;
			}
			else if(string_pos_ext("pd", _string, _strnum+1)==_strnum+2){
				array_push(_rpn,"spd");
				if(_lastnum==1){
					array_push(_rpn,"*");
				}
				_lastnum=1;
				_strnum+=2;
			}
			else if(string_pos_ext("peed", _string, _strnum+1)==_strnum+2){
				array_push(_rpn,"spd");
				if(_lastnum==1){
					array_push(_rpn,"*");
				}
				_lastnum=1;
				_strnum+=4;
			}
			_strnum++;
		}
		//处理)
		else if(string_char_at(_string,_strnum+1)==")"){
			if(_lastnum=1){
				var _gunmu=0;
				while(array_length(_sym)>0&&
				_sym[array_length(_sym)-1]!="("&&_sym[array_length(_sym)-1]!="abs"
				&&_sym[array_length(_sym)-1]!="sin"&&_sym[array_length(_sym)-1]!="cos"
				&&_sym[array_length(_sym)-1]!="pow"&&_sym[array_length(_sym)-1]!="flo"
				&&_sym[array_length(_sym)-1]!="txt"&&_sym[array_length(_sym)-1]!="skn"
				&&_sym[array_length(_sym)-1]!="min"&&_sym[array_length(_sym)-1]!="max"
				&&_sym[array_length(_sym)-1]!="spr"
				){
					if(_sym[array_length(_sym)-1]=="gunmu"){
						array_pop(_sym);
						_gunmu++;
					}
					else{
						array_push(_rpn,_sym[array_length(_sym)-1]);
						array_pop(_sym);
					}
				}
				if(array_length(_sym)>0){
					if(_gunmu==0){
						if(_sym[array_length(_sym)-1]!="("&&_sym[array_length(_sym)-1]!="abs"
						&&_sym[array_length(_sym)-1]!="sin"&&_sym[array_length(_sym)-1]!="cos"
						&&_sym[array_length(_sym)-1]!="flo"
						&&_sym[array_length(_sym)-1]!="txt"&&_sym[array_length(_sym)-1]!="skn"
						){
							return[[[0]],[]];
						}
						if(_sym[array_length(_sym)-1]!="("){
							array_push(_rpn,_sym[array_length(_sym)-1]);
						}
					}
					else if(_gunmu==1){
						if(_sym[array_length(_sym)-1]!="pow"&&_sym[array_length(_sym)-1]!="spr"
						&&_sym[array_length(_sym)-1]!="min"&&_sym[array_length(_sym)-1]!="max"
						){
							return[[[0]],[]];
						}
						array_push(_rpn,_sym[array_length(_sym)-1]);
					}
					else return[[[0]],[]];
					
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
				_sym[array_length(_sym)-1]!="gunmu"&&_sym[array_length(_sym)-1]!="pow"
				&&_sym[array_length(_sym)-1]!="min"&&_sym[array_length(_sym)-1]!="max"
				&&_sym[array_length(_sym)-1]!="spr"
				){
					array_push(_rpn,_sym[array_length(_sym)-1]);
					array_pop(_sym);
				}
				if(array_length(_sym)==0){
					return[[[0]],[]];
				}
				array_push(_sym,"gunmu");
				_lastnum=0;
			}
			else return[[[0]],[]];
			_strnum++;
		}
		//处理;
		else if(string_char_at(_string,_strnum+1)==";"){
			if(_lastnum=1){
				while(array_length(_sym)>0){
					if(_sym[array_length(_sym)-1]=="("||_sym[array_length(_sym)-1]=="abs"
					||_sym[array_length(_sym)-1]=="sin"||_sym[array_length(_sym)-1]=="cos"
					||_sym[array_length(_sym)-1]=="pow"||_sym[array_length(_sym)-1]=="flo"
					||_sym[array_length(_sym)-1]=="min"||_sym[array_length(_sym)-1]=="max"
					||_sym[array_length(_sym)-1]=="skn"||_sym[array_length(_sym)-1]=="spr"){
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
		if(_sym[array_length(_sym)-1]=="("||_sym[array_length(_sym)-1]=="gunmu"
			||_sym[array_length(_sym)-1]=="sin"||_sym[array_length(_sym)-1]=="cos"
			||_sym[array_length(_sym)-1]=="pow"||_sym[array_length(_sym)-1]=="flo"
			||_sym[array_length(_sym)-1]=="txt"||_sym[array_length(_sym)-1]=="skn"
			||_sym[array_length(_sym)-1]=="min"||_sym[array_length(_sym)-1]=="max"
			||_sym[array_length(_sym)-1]=="abs"||_sym[array_length(_sym)-1]=="spr"
		){
			return[[[0]],[]];
		}
		else{
			array_push(_rpn,_sym[array_length(_sym)-1]);
			array_pop(_sym);
		}
	}
	array_push(_rpnall[0],_rpn);
	show_debug_message(_rpnall);
	return _rpnall;
}