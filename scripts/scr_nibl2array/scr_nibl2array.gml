function scr_nibl2array(_str){
	if(scr_stringtreal(_str)==1){
		return real(_str);
	}
	else{
		var _array=[[],[]];
		_str=string_split(_str,"(");
		for(var _i=1;_i<array_length(_str);_i++){
			if(_i%2==1){
				_str[_i]=string_split(_str[_i],")");
				for(var _j=0;_j<array_length(_str[_i]);_j++){
					if(scr_stringtreal(_str[_i][_j])==1){
						_str[_i][_j]=real(_str[_i][_j]);
					}
				}
				array_push(_array[0],_str[_i]);
			}
			else{
				_str[_i]=real(_str[_i]);
				array_push(_array[1],_str[_i]);
			}
		}
		return _array;
	}
}