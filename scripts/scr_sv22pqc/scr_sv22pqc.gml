function scr_sv22pqc(_file){
	_file = file_text_open_read(_file);
	var _chartread = [];
	var i=0;
	while (!file_text_eof(_file))
	{
	    _chartread[i] = string_split(file_text_read_string(_file),",");
		
		while (_chartread[i][0]==""&&!file_text_eof(_file)){
			array_delete(_chartread,i,1);
			file_text_readln(_file);
			_chartread[i] = string_split(file_text_read_string(_file),",");
		}
		if (_chartread[i][0]=="") {array_delete(_chartread,i,1);
			i--;
			}
	    file_text_readln(_file);
		i++;
	}
	file_text_close(_file);
	var _chart=[];
	show_debug_message(_chartread)
	for(var _i=0;_i<array_length(_chartread);_i++){
		if(_chartread[_i][1]=="0"){
			array_push(_chart,["T",real(_chartread[_i][0]),real(_chartread[_i][2])+1,0,1]);
		}
		else if(_chartread[_i][1]=="1"){
			array_push(_chart,["BP",real(_chartread[_i][0]),real(_chartread[_i][2])+1,0,0]);
		}
		else if(_chartread[_i][1]=="2"){
			array_push(_chart,["LN",real(_chartread[_i][0]),real(_chartread[_i][2])+1,0,real(_chartread[_i][3]),0]);
		}
		else if(_chartread[_i][1]=="6"){
			array_push(_chart,["M",real(_chartread[_i][0]),real(_chartread[_i][2])+1,0,0]);
		}
		else if(_chartread[_i][1]=="7"){
			array_push(_chart,["M",real(_chartread[_i][0]),real(_chartread[_i][2])+1,0,0]);
			array_push(_chart,["M",real(_chartread[_i][0]),real(_chartread[_i][2])+2,0,0]);
		}
		else if(_chartread[_i][1]=="8"){
			array_push(_chart,["BP",real(_chartread[_i][0]),real(_chartread[_i][2])+1,0,1]);
		}
	}
	
	return _chart;
}