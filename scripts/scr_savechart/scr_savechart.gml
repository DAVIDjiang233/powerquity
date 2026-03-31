function scr_savechart(_file,_filesv,_filebpm){
	
	_file = file_text_open_write(_file);
	file_text_write_string(_file, string(-ctrl_chartdesign.delay)+"\n");
	file_text_write_string(_file, string(ctrl_chartdesign.gametype)+"\n");
	
	for (var j = 0; j < array_length(global.chartread); j++) {
		var _result_string="";
				
		for (var i = 0; i < array_length(global.chartread[j]); i++) {
				
			if(scr_stringtreal(global.chartread[j][i])==0){
				_result_string += global.chartread[j][i];
			}
			else{
				_result_string += scr_floatostring(real(global.chartread[j][i]));
			}
			// 如果不是最后一个元素，添加分隔符
			if (i < array_length(global.chartread[j]) - 1) {
				_result_string += ",";
			}

		}
		file_text_write_string(_file, _result_string+"\n");
			
		}

	
	file_text_close(_file);
	
	_filesv = file_text_open_write(_filesv);
	var _svlist=[];
	array_copy(_svlist,0,global.svchange[9],0,array_length(global.svchange[9]));
	for (var j = 0; j < array_length(global.svchange[5]); j++) {
		for (var i = 0; i < array_length(global.svchange[5][j]); i++) {
			array_push(_svlist,[
				"S",
				scr_floatostring(global.svchange[5][j][i][0]),
				scr_floatostring(global.svchange[5][j][i][1]),
				scr_floatostring(global.svchange[5][j][i][2]),
				scr_floatostring(j),
				scr_floatostring(global.svchange[5][j][i][3])
			]);
		}
	}
	for (var j = 0; j < array_length(global.svchange[8]); j++) {
		for (var i = 0; i < array_length(global.svchange[8][j]); i++) {
			array_push(_svlist,[
				"X",
				scr_floatostring(global.svchange[8][j][i][0]),
				scr_floatostring(global.svchange[8][j][i][1]),
				scr_floatostring(global.svchange[8][j][i][2]),
				scr_floatostring(j),
				scr_floatostring(global.svchange[8][j][i][3])
			]);
		}
	}
	for (var j = 0; j < array_length(global.svchange[6]); j++) {
		for (var i = 0; i < array_length(global.svchange[6][j]); i++) {
			array_push(_svlist,[
				"M",
				scr_floatostring(global.svchange[6][j][i][0]),
				scr_floatostring(global.svchange[6][j][i][1]),
				scr_floatostring(global.svchange[6][j][i][2]),
				scr_floatostring(j),
				scr_floatostring(global.svchange[6][j][i][3])
			]);
		}
	}
	for (var j = 0; j < array_length(global.svchange[7]); j++) {
		for (var i = 0; i < array_length(global.svchange[7][j]); i++) {
			array_push(_svlist,[
				"MG",
				scr_floatostring(global.svchange[7][j][i][0]),
				scr_floatostring(global.svchange[7][j][i][1]),
				scr_floatostring(global.svchange[7][j][i][2]),
				scr_floatostring(j),
				scr_floatostring(global.svchange[7][j][i][3])
			]);
		}
	}
	for (var j = 0; j < array_length(global.svchange[1]); j++) {
		for (var i = 0; i < array_length(global.svchange[1][j]); i++) {
			array_push(_svlist,[
				"SN",
				scr_floatostring(global.svchange[1][j][i][0]),
				scr_floatostring(global.svchange[1][j][i][1]),
				scr_floatostring(j)
			]);
		}
	}
	for (var j = 0; j < array_length(global.svchange[4]); j++) {
		for (var i = 0; i < array_length(global.svchange[4][j]); i++) {
			array_push(_svlist,[
				"XN",
				scr_floatostring(global.svchange[4][j][i][0]),
				scr_floatostring(global.svchange[4][j][i][1]),
				scr_floatostring(j)
			]);
		}
	}
	for (var j = 0; j < array_length(global.svchange[2]); j++) {
		for (var i = 0; i < array_length(global.svchange[2][j]); i++) {
			array_push(_svlist,[
				"MN",
				scr_floatostring(global.svchange[2][j][i][0]),
				scr_floatostring(global.svchange[2][j][i][1]),
				scr_floatostring(j)
			]);
		}
	}
	for (var j = 0; j < array_length(global.svchange[3]); j++) {
		for (var i = 0; i < array_length(global.svchange[3][j]); i++) {
			array_push(_svlist,[
				"MGN",
				scr_floatostring(global.svchange[3][j][i][0]),
				scr_floatostring(global.svchange[3][j][i][1]),
				scr_floatostring(j)
			]);
		}
	}
	for (var j = 0; j < array_length(global.svchange[0]); j++) {
		for (var i = 0; i < array_length(global.svchange[0][j]); i++) {
			array_push(_svlist,[
				"SC",
				scr_floatostring(global.svchange[0][j][i][0]),
				scr_floatostring(global.svchange[0][j][i][1]),
				scr_floatostring(j)
			]);
		}
	}
	
	
	
		//show_debug_message(_svlist);
	
	array_sort(_svlist,function(elm1, elm2){
		return real(elm1[1])-real(elm2[1]);
	});
	

	
	for (var j = 0; j < array_length(_svlist); j++) {
		var _result_string="";
				
		for (var i = 0; i < array_length(_svlist[j]); i++) {
				
			if(scr_stringtreal(_svlist[j][i])==0){
				_result_string += _svlist[j][i];
			}
			else{
				_result_string += scr_floatostring(real(_svlist[j][i]));
			}
			// 如果不是最后一个元素，添加分隔符
			if (i < array_length(_svlist[j]) - 1) {
				_result_string += ",";
			}

		}
		file_text_write_string(_filesv, _result_string+"\n");
			
		}
	
	file_text_close(_filesv);
	
	_filebpm = file_text_open_write(_filebpm);
	
	for (var j = 0; j < array_length(global.bpmlist); j++) {
		var _result_string="";
				
		for (var i = 0; i < array_length(global.bpmlist[j]); i++) {
				
			if(scr_stringtreal(global.bpmlist[j][i])==0){
				_result_string += global.bpmlist[j][i];
			}
			else{
				_result_string += scr_floatostring(real(global.bpmlist[j][i]));
			}
			// 如果不是最后一个元素，添加分隔符
			if (i < array_length(global.bpmlist[j]) - 1) {
				_result_string += ",";
			}

		}
		file_text_write_string(_filebpm, _result_string+"\n");
			
		}

	
	file_text_close(_filebpm);
	
	
}