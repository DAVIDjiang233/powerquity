function scr_loadskin(_filein,_play=1,_end=1){
	
	var _fileread=[];
	var _lastplayskinum=array_length(global.playskin)-1;
	var _lastplaytextnum=array_length(global.playtext)-1;
	var _lastplaypictnum=array_length(global.playsprite)-1;
	var _lastfontnum=array_length(global.fontall)-1;
	
	//游玩界面
	
	if (file_exists(working_directory + _filein + "/0play.txt")){
		var _file = file_text_open_read(working_directory + _filein + "/0play.txt");
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
			if(_fileread[_i][0]=="F"){
				array_delete(_fileread[_i],0,1);
				if(_fileread[_i][0]<=-1){
					_fileread[_i][0]=_lastfontnum-_fileread[_i][0];
				}
				if(_lastfontnum<_fileread[_i][0]||_play!=0||global.fontall[_fileread[_i][0]]==0){
					if(real(_fileread[_i][0])<array_length(global.fontall)
					&&global.fontall[real(_fileread[_i][0])]!=0){
						font_delete(global.fontall[real(_fileread[_i][0])]);
					}
					if(scr_stringtreal(_fileread[_i][1])==1){
						if(_fileread[_i][1]<=-1){
							_fileread[_i][1]=_lastplayskinum-_fileread[_i][1];
						}
						if(real(_fileread[_i][5])>=0&&real(_fileread[_i][5])<=string_length(_fileread[_i][2])){
							_fileread[_i][2]=string_insert(",",_fileread[_i][2],real(_fileread[_i][5]));
						}
						global.fontall[real(_fileread[_i][0])]=
						font_add_sprite_ext(global.playskin[real(_fileread[_i][1])],
						_fileread[_i][2],real(_fileread[_i][3]),real(_fileread[_i][4]));
					}
					else{
						global.fontall[real(_fileread[_i][0])]=font_add(
							working_directory+_filein+"/"+_fileread[_i][1]
							, real(_fileread[_i][2]),0,0,32,128);
					}
				}
				//global.fontall[0]=font_add(working_directory + "/skin/font.ttf",64,0,0,32,128);
			}
			else if(_fileread[_i][0]=="N"&&_play!=0){
				global.skinnumber[_fileread[_i][1]]=real(_fileread[_i][2]);
			}
			else if(_fileread[_i][0]=="T"&&_play!=0){
				array_delete(_fileread[_i],0,1);
				
				if(_fileread[_i][0]<=-1){
					_fileread[_i][0]=_lastplaytextnum-_fileread[_i][0];
				}
				global.playtext[real(_fileread[_i][0])]=_fileread[_i];
				global.playtext[real(_fileread[_i][0])][1]=real(global.playtext[real(_fileread[_i][0])][1]);
				global.playtext[real(_fileread[_i][0])][2]=real(global.playtext[real(_fileread[_i][0])][2]);
				global.playtext[real(_fileread[_i][0])][10]=real(global.playtext[real(_fileread[_i][0])][10]);
				global.playtext[real(_fileread[_i][0])][11]=real(global.playtext[real(_fileread[_i][0])][11]);
				global.playtext[real(_fileread[_i][0])][12]=real(global.playtext[real(_fileread[_i][0])][12]);
				global.playtext[real(_fileread[_i][0])][13]=real(global.playtext[real(_fileread[_i][0])][13]);
				global.playtext[real(_fileread[_i][0])][3]=scr_nibl2array(global.playtext[real(_fileread[_i][0])][3]);
				global.playtext[real(_fileread[_i][0])][4]=scr_nibl2array(global.playtext[real(_fileread[_i][0])][4]);
				global.playtext[real(_fileread[_i][0])][6]=scr_nibl2array(global.playtext[real(_fileread[_i][0])][6]);
				global.playtext[real(_fileread[_i][0])][7]=scr_nibl2array(global.playtext[real(_fileread[_i][0])][7]);
				global.playtext[real(_fileread[_i][0])][8]=scr_nibl2array(global.playtext[real(_fileread[_i][0])][8]);
				global.playtext[real(_fileread[_i][0])][9]=scr_nibl2array(global.playtext[real(_fileread[_i][0])][9]);
				
				if(global.playtext[real(_fileread[_i][0])][10]<=-1){
					global.playtext[real(_fileread[_i][0])][10]=_lastfontnum-global.playtext[real(_fileread[_i][0])][10];
				}
				array_delete(global.playtext[real(_fileread[_i][0])],0,1);
			}
			else if(_fileread[_i][0]=="TC"&&_play!=0){
				array_delete(_fileread[_i],0,1);
				
				if(_fileread[_i][0]<=-1){
					_fileread[_i][0]=_lastplaytextnum-_fileread[_i][0];
				}
				if(real(_fileread[_i][1])==4){
					global.playtext[real(_fileread[_i][0])][real(_fileread[_i][1])]=_fileread[_i][2];
				}
				else if(real(_fileread[_i][1])==10&&real(_fileread[_i][2])<=1){
					global.playtext[real(_fileread[_i][0])][10]=_lastfontnum-real(_fileread[_i][2]);
				}
				else{
					global.playtext[real(_fileread[_i][0])][real(_fileread[_i][1])]=scr_nibl2array(_fileread[_i][2]);
				}
				
			}
			else if(_fileread[_i][0]=="P"&&_play!=0){
				array_delete(_fileread[_i],0,1);
				
				if(_fileread[_i][0]<=-1){
					_fileread[_i][0]=_lastplaypictnum-_fileread[_i][0];
				}
				if(_fileread[_i][4]<=-1){
					_fileread[_i][4]=_lastplayskinum-_fileread[_i][4];
				}
				global.playsprite[real(_fileread[_i][0])]=_fileread[_i];
				global.playsprite[real(_fileread[_i][0])][1]=real(global.playsprite[real(_fileread[_i][0])][1]);
				global.playsprite[real(_fileread[_i][0])][4]=real(global.playsprite[real(_fileread[_i][0])][4]);
				global.playsprite[real(_fileread[_i][0])][9]=real(global.playsprite[real(_fileread[_i][0])][9]);
				global.playsprite[real(_fileread[_i][0])][10]=real(global.playsprite[real(_fileread[_i][0])][10]);
				global.playsprite[real(_fileread[_i][0])][11]=real(global.playsprite[real(_fileread[_i][0])][11]);
				global.playsprite[real(_fileread[_i][0])][2]=scr_nibl2array(global.playsprite[real(_fileread[_i][0])][2]);
				global.playsprite[real(_fileread[_i][0])][3]=scr_nibl2array(global.playsprite[real(_fileread[_i][0])][3]);
				global.playsprite[real(_fileread[_i][0])][5]=scr_nibl2array(global.playsprite[real(_fileread[_i][0])][5]);
				global.playsprite[real(_fileread[_i][0])][6]=scr_nibl2array(global.playsprite[real(_fileread[_i][0])][6]);
				global.playsprite[real(_fileread[_i][0])][7]=scr_nibl2array(global.playsprite[real(_fileread[_i][0])][7]);
				global.playsprite[real(_fileread[_i][0])][8]=scr_nibl2array(global.playsprite[real(_fileread[_i][0])][8]);
				array_delete(global.playsprite[real(_fileread[_i][0])],0,1);
				//show_debug_message(global.playsprite)
			}
			else if(_fileread[_i][0]=="PC"&&_play!=0){
				array_delete(_fileread[_i],0,1);
				
				if(_fileread[_i][0]<=-1){
					_fileread[_i][0]=_lastplaypictnum-_fileread[_i][0];
				}
				global.playsprite[real(_fileread[_i][0])][real(_fileread[_i][1])]=scr_nibl2array(_fileread[_i][2]);
			}
			else if(_fileread[_i][0]=="S"){
				array_delete(_fileread[_i],0,1);
				
				if(_fileread[_i][0]<=-1){
					_fileread[_i][0]=_lastplayskinum-_fileread[_i][0];
				}
				if(_lastplayskinum<_fileread[_i][0]||_play!=0||global.playskin[_fileread[_i][0]]==0){
					if(scr_stringtreal(_fileread[_i][1])==1){
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
									//show_debug_message("clean")
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
								//show_debug_message("clean")
							}
						}
					
						if(real(_fileread[_i][2])>=1){
							global.playskin[real(_fileread[_i][0])]=sprite_add(
							working_directory+_filein+"/"+_fileread[_i][1]
							, real(_fileread[_i][2]), false, false, real(_fileread[_i][3]), real(_fileread[_i][4]));
						}
						else{
							var _name=working_directory+_filein+"/"+string_insert("_{0}",_fileread[_i][1],string_last_pos(".",_fileread[_i][1]));
							global.playskin[real(_fileread[_i][0])]=sprite_add(
							string(_name,0)
							, 1, false, false, real(_fileread[_i][3]), real(_fileread[_i][4]));
							var _num=1;
							while(file_exists(string(_name,_num))){
								var _sprtemp=sprite_add(
								string(_name,_num)
								, 1, false, false, 0, 0);
								sprite_merge(global.playskin[real(_fileread[_i][0])],_sprtemp);
								sprite_delete(_sprtemp);
								_num++;
							}
						}
					}
				}
			}
		}
	}
	
	return([_lastplayskinum,_lastplaytextnum]);
}