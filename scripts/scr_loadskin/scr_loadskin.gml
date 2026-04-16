function scr_loadskin(_filein){
	
	var _fileread=[];
	var _lastskinum=array_length(global.playskin)-1;
	//游玩界面
	
	if (file_exists(working_directory + _filein + "skin/0play.txt")){
		var _file = file_text_open_read(working_directory + _filein + "skin/0play.txt");
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
				if(_fileread[_i][0]<=-1){
					_fileread[_i][0]=_lastskinum-_fileread[_i][0];
				}
				if(_fileread[_i][0]>=69&&_fileread[_i][0]<=91){
					global.playskin[real(_fileread[_i][0])]=real(_fileread[_i][1]);
				}
				else if(scr_stringtreal(_fileread[_i][1])==1){
					if(real(_fileread[_i][1])!=real(_fileread[_i][0])){
						if(real(_fileread[_i][0])<array_length(global.playskin)
						&&string_starts_with(sprite_get_name(global.playskin[real(_fileread[_i][0])]),"__")){
							var _j=0
							while(_j<array_length(global.playskin)){
								if(global.playskin[real(_fileread[_i][0])]==global.playskin[_j]
									&&real(_fileread[_i][0])!=_j){
									break;
								}
								_j++
							}
							if(_j==array_length(global.playskin)){
								sprite_delete(global.playskin[real(_fileread[_i][0])]);
								show_debug_message("clean")
							}
						}
						global.playskin[real(_fileread[_i][0])]=global.playskin[real(_fileread[_i][1])];
					}
				}
				else{
					
					if(real(_fileread[_i][0])<array_length(global.playskin)
					&&string_starts_with(sprite_get_name(global.playskin[real(_fileread[_i][0])]),"__")){
						var _j=0
						while(_j<array_length(global.playskin)){
							if(global.playskin[real(_fileread[_i][0])]==global.playskin[_j]
								&&real(_fileread[_i][0])!=_j){
								break;
							}
							_j++
						}
						if(_j==array_length(global.playskin)){
							sprite_delete(global.playskin[real(_fileread[_i][0])]);
							show_debug_message("clean")
						}
					}
					
					global.playskin[real(_fileread[_i][0])]=sprite_add(
					working_directory+_filein+"skin/"+_fileread[_i][1]
					, real(_fileread[_i][2]), false, false, real(_fileread[_i][3]), real(_fileread[_i][4]))
				}
			}
		}
		
	}
	
	return(_lastskinum);
}