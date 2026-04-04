function scr_array2nibl(_array){
	if(typeof(_array)=="array"){
		var _string="0("
		var _i=0;
		for(_i=0;_i<array_length(_array[1]);_i++){
			for(var _j=0;_j<array_length(_array[0][_i]);_j++){
				if(typeof(_array[0][_i][_j])=="string"){
					_string+=_array[0][_i][_j];
				}
				else {
					_string+=scr_floatostring(_array[0][_i][_j]);
				}
				if(_j<array_length(_array[0][_i])-1) _string+=")";
			}
			_string+="(";
			_string+=scr_floatostring(_array[1][_i]);
			if(_i<array_length(_array[0])-1) _string+="(";
		}
		for(var _j=0;_j<array_length(_array[0][_i]);_j++){
			if(typeof(_array[0][_i][_j])=="string"){
				_string+=_array[0][_i][_j];
			}
			else {
				_string+=scr_floatostring(_array[0][_i][_j]);
			}
			if(_j<array_length(_array[0][_i])-1) _string+=")";
		}
		return _string;
	}
	else return scr_floatostring(_array)
}