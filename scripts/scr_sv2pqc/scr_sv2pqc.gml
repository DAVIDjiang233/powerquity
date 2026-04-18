function scr_sv2pqc(_file){
	_file = file_text_open_read(_file);
	var i=0;
	var _fileread="";
	while (!file_text_eof(_file))
	{
		_fileread += file_text_read_string(_file);
		file_text_readln(_file);
		i++;
	}
	file_text_close(_file);
	_fileread=json_parse(_fileread)
	for(var _i=0;_i<array_length(_fileread.diffs);_i++){
		if(string(global.fileread[global.level*2+4])==string(_fileread.diffs[_i].meta.diff1)+" "+string(_fileread.diffs[0].meta.diff2)){
			var _json=_fileread.diffs[_i].notes;
			//show_debug_message(_json);
			var _chart=[];
			for(var _j=0;_j<array_length(_json);_j++){
				if(struct_exists(_json[_j],"snm")){

					if(_json[_j].width==1){
						if(_json[_j].snm==1){
							array_push(_chart,["M",_json[_j].time,_json[_j].lane+1,0,0]);
						}
						else array_push(_chart,["T",_json[_j].time,_json[_j].lane+1,0,1]);
					}
					else if(_json[_j].width==2){
						if(_json[_j].snm==1){
							array_push(_chart,["M",_json[_j].time,_json[_j].lane+1,0,0]);
							array_push(_chart,["M",_json[_j].time,_json[_j].lane+2,0,0]);
						}
						else array_push(_chart,["BP",_json[_j].time,_json[_j].lane+1,0,_json[_j].snm/2]);
					}
					else if(_json[_j].width==3){
						if(_json[_j].snm==1){
							array_push(_chart,["M",_json[_j].time,_json[_j].lane+1,0,0]);
							array_push(_chart,["M",_json[_j].time,_json[_j].lane+2,0,0]);
							array_push(_chart,["M",_json[_j].time,_json[_j].lane+3,0,0]);
						}
						else array_push(_chart,["TP",_json[_j].time,_json[_j].lane+1,0,_json[_j].snm/2]);
					}
					else if(_json[_j].width==4){
						if(_json[_j].snm==1){
							array_push(_chart,["M",_json[_j].time,1,0,0]);
							array_push(_chart,["M",_json[_j].time,2,0,0]);
							array_push(_chart,["M",_json[_j].time,3,0,0]);
							array_push(_chart,["M",_json[_j].time,4,0,0]);
						}
						else array_push(_chart,["QP",_json[_j].time,1,0,_json[_j].snm/2]);
					}
				}
				else if(struct_exists(_json[_j],"len")){
					if(_json[_j].width==1){
						array_push(_chart,["LN",_json[_j].time,_json[_j].lane+1,0,_json[_j].time+_json[_j].len,0]);
					}
					else if(_json[_j].width==2){
						array_push(_chart,["BP",_json[_j].time,_json[_j].lane+1,0,0]);
					}
					else if(_json[_j].width==3){
						array_push(_chart,["TP",_json[_j].time,_json[_j].lane+1,0,0]);
					}
					else if(_json[_j].width==4){
						array_push(_chart,["QP",_json[_j].time,1,0,0]);
					}
				}
			}
			return _chart;
		}
	}
	//show_debug_message(_fileread.diffs[0].notes);
	//show_debug_message(string(_fileread.diffs[0].meta.diff1)+" "+string(_fileread.diffs[0].meta.diff2));
	return [];
}