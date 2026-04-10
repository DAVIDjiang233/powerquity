function scr_loadskin(_filein){
	
	var _fileread=[]
	if (file_exists(working_directory + "skin/"+_filein+"0play.txt")){
		var _file = file_text_open_read(working_directory + "skin/"+_filein+"0play.txt");
		var i=0;
		while (!file_text_eof(_file))
		{
		    _fileread[i] = string_split(file_text_read_string(_file),",");
			while (_fileread[i]==""&&!file_text_eof(_file)){
				array_delete(_fileread,i,1);
				file_text_readln(_file);
				_fileread[i] = string_split(file_text_read_string(_file),",");
			}
			if (_fileread[i]=="") array_delete(_fileread,i,1);
		    file_text_readln(_file);
			i++;
		}
		file_text_close(_file);
		
		for(var _i=0;_i<array_length(_fileread);_i++){
			if(scr_stringtreal(_fileread[_i][0])==1){
				if(_fileread[_i][0]>=65&&_fileread[_i][0]<=74){
					global.playskin[real(_fileread[_i][0])]=real(_fileread[_i][1]);
				}
				else if(scr_stringtreal(_fileread[_i][1])==1){
					global.playskin[real(_fileread[_i][0])]=global.playskin[real(_fileread[_i][1])];
				}
				else{
					global.playskin[real(_fileread[_i][0])]=sprite_add(
					working_directory+"/skin/"+_filein+_fileread[_i][1]
					, real(_fileread[_i][2]), false, false, real(_fileread[_i][3]), real(_fileread[_i][4]))
				}
			}
		}
		
	}
}