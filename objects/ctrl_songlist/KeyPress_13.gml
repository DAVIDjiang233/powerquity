if moding==1{
	if modtype==0 {
		if playtypemod!=2 playtypemod++;
		else playtypemod=0;
	}
	else if modtype==1 {
		if global.svenable==0 global.svenable=1;
		else global.svenable=0;
	}
	else if modtype==4 {
		if global.mirror==0 global.mirror=1;
		else global.mirror=0;
	}
	else if modtype==5 {
		if global.autoplay>=2 global.autoplay=0;
		else global.autoplay++;
	}
}
else if chartloading==1{
	if modtype==0{
		var loadchart;
		loadchart = get_open_filename("powerquity chart file|*.pqp;*.zip;*.svc", "");
		if (loadchart != ""){
			if(filename_ext(loadchart)==".svc"){
				var q=zip_unzip(loadchart, working_directory + "songlist/"+filename_change_ext(filename_name(loadchart),"")+"/");
				scr_svcload(working_directory + "songlist/"+filename_change_ext(filename_name(loadchart),"")+"/");
				scr_restart();
			}
			else if(filename_ext(loadchart)==".zip"){
				var _tempnumber=string(get_timer());
				show_debug_message(temp_directory + _tempnumber + "/");
				directory_create(temp_directory + _tempnumber + "/");
				var q=zip_unzip(loadchart, temp_directory + _tempnumber + "/");
				if(file_exists(temp_directory + _tempnumber + "/info.json")){
					q=zip_unzip(loadchart, working_directory + "songlist/" + filename_change_ext(filename_name(loadchart),"")+"/");
					scr_svzipload(working_directory + "songlist/" + filename_change_ext(filename_name(loadchart),"")+"/");
				}
				else{
					var _dictname = file_find_first(temp_directory + _tempnumber + "/*", fa_directory);

					q=zip_unzip(loadchart, working_directory + "songlist/");
					if(file_exists(working_directory + "songlist/" + _dictname + "/info.json")){
						scr_svzipload(working_directory + "songlist/" + _dictname + "/");
					}
				}
				directory_destroy(temp_directory + _tempnumber + "/");
				scr_restart();
			}
			else{
				var q=zip_unzip(loadchart, working_directory + "songlist/");
				scr_restart();
			}
		}
	}
	else if modtype==1{
		if confirmt==0 confirmt=1;
		else {
			if (file_exists(working_directory+"highscore/"+string(global.filelist[global.chart])+".pqc")) 
				file_delete(working_directory+"highscore/"+string(global.filelist[global.chart])+".pqc");
			readfile();
			confirmt=0;
			}
		
	}
	else if modtype==2{
		if confirmt==0 confirmt=1;
		else {
			if (directory_exists(working_directory+"songlist/"+string(global.filelist[global.chart]))) 
				directory_destroy(working_directory+"songlist/"+string(global.filelist[global.chart]));
			scr_restart();
		}
	}
	else if modtype==3{
		if global.level==0 exit;
		if (confirmt==0) confirmt=1;
		else {
			file_rename(
				working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+".pqc",
				working_directory+"temp.pqc"
			);
			file_rename(
				working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(global.level-1)+".pqc",
				working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+".pqc"
			);
			
			file_rename(
				working_directory+"temp.pqc",
				working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(global.level-1)+".pqc"
			);
			file_rename(
				working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv.pqc",
				working_directory+"temp.pqc"
			);
			file_rename(
				working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(global.level-1)+"_sv.pqc",
				working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv.pqc"
			);
			file_rename(
				working_directory+"temp.pqc",
				working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(global.level-1)+"_sv.pqc"
			);
			var _file = file_text_open_write(working_directory + "songlist/"+string(global.filelist[global.chart])+"/main.pqc");
			
			var _temp=global.fileread[3+global.level*2];
			global.fileread[3+global.level*2]=global.fileread[1+global.level*2];
			global.fileread[1+global.level*2]=_temp;
			_temp=global.fileread[4+global.level*2];
			global.fileread[4+global.level*2]=global.fileread[2+global.level*2];
			global.fileread[2+global.level*2]=_temp;
			for(var _i=0;_i<array_length(global.fileread);_i++){
				file_text_write_string(_file, global.fileread[_i]);
				if(_i!=array_length(global.fileread)-1){
					file_text_write_string(_file,"\n");
				}
			}
			file_text_close(_file);
			_file = file_text_open_write(working_directory + "highscore/"+string(global.filelist[global.chart])+".pqc");
			_temp=global.highscore[global.level];
			global.highscore[global.level]=global.highscore[global.level-1];
			global.highscore[global.level-1]=_temp;
			var i=0;
			while(i<array_length(global.highscore)){
				file_text_write_string(_file,string_format(global.highscore[i],0,4)+"\n");
				i++;
			}
			file_text_close(_file);

			scr_restart();
		}
	}
	else if modtype==4{
		if (global.level==array_length(global.fileread)-5) exit;
		if (confirmt==0) confirmt=1;
		else {
			file_rename(
				working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+".pqc",
				working_directory+"temp.pqc"
			);
			file_rename(
				working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(global.level+1)+".pqc",
				working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+".pqc"
			);
			
			file_rename(
				working_directory+"temp.pqc",
				working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(global.level+1)+".pqc"
			);
			file_rename(
				working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv.pqc",
				working_directory+"temp.pqc"
			);
			file_rename(
				working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(global.level+1)+"_sv.pqc",
				working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv.pqc"
			);
			file_rename(
				working_directory+"temp.pqc",
				working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(global.level+1)+"_sv.pqc"
			);
			var _file = file_text_open_write(working_directory + "songlist/"+string(global.filelist[global.chart])+"/main.pqc");
			
			var _temp=global.fileread[6+global.level];
			global.fileread[6+global.level]=global.fileread[4+global.level];
			global.fileread[4+global.level]=_temp;
			_temp=global.fileread[5+global.level];
			global.fileread[5+global.level]=global.fileread[3+global.level];
			global.fileread[3+global.level]=_temp;
			for(var _i=0;_i<array_length(global.fileread);_i++){
				file_text_write_string(_file, global.fileread[_i]);
				if(_i!=array_length(global.fileread)-1){
					file_text_write_string(_file,"\n");
				}
			}
			file_text_close(_file);
			_file = file_text_open_write(working_directory + "highscore/"+string(global.filelist[global.chart])+".pqc");
			_temp=global.highscore[global.level];
			global.highscore[global.level]=global.highscore[global.level+1];
			global.highscore[global.level+1]=_temp;
			var i=0;
			while(i<array_length(global.highscore)){
				file_text_write_string(_file,string_format(global.highscore[i],0,4)+"\n");
				i++;
			}
			file_text_close(_file);

			scr_restart();
		}
	}
	else if modtype==5 {
		msg = get_integer_async("输入谱面标识名", string_split(global.filelist[global.chart],".")[0]);
	}
	else if modtype==6 {
		if(array_length(string_split(global.filelist[global.chart],"."))==1){
			msg = get_integer_async("输入谱面发布者", "");
		}
		else{
			var _zipnum=string_split(global.filelist[global.chart],".")[0]+"."+string_split(global.filelist[global.chart],".")[1];
			var _file=get_save_filename("powerquity chart file|*.pqp;*.zip", _zipnum);

			if (_file != "")
			{
				var _zip = zip_create();
				for(var _i=0;_i*2<array_length(global.fileread)-4;_i++){
					if (file_exists(working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(_i)+".pqc")){
						zip_add_file(_zip
						, _zipnum+"/"+string(_i)+".pqc"
						, working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(_i)+".pqc");
					}
					if (file_exists(working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(_i)+"_sv.pqc")){
						zip_add_file(_zip
						, _zipnum+"/"+string(_i)+"_sv.pqc"
						, working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(_i)+"_sv.pqc");
					}
				}
				if (file_exists(working_directory+"songlist/"+string(global.filelist[global.chart])+"/bpmlist.pqc")){
					zip_add_file(_zip
					, _zipnum+"/bpmlist.pqc"
					, working_directory+"songlist/"+string(global.filelist[global.chart])+"/bpmlist.pqc");
				}
				zip_add_file(_zip
					, _zipnum+"/base.ogg"
					, working_directory+"songlist/"+string(global.filelist[global.chart])+"/base.ogg");
						
				zip_add_file(_zip
					, _zipnum+"/main.pqc"
					, working_directory+"songlist/"+string(global.filelist[global.chart])+"/main.pqc");
				if (directory_exists(working_directory+"songlist/"+string(global.filelist[global.chart])+"/skin/"))
				{
					var _files = [];
					var _file_name = file_find_first(working_directory+"songlist/"+string(global.filelist[global.chart])+"/skin/*", 0);

					while (_file_name != "")
					{
						array_push(_files, _file_name);
						_file_name = file_find_next();
					}
					file_find_close();
					//show_debug_message(_files)
					for(var _i=0;_i<array_length(_files);_i++){
						zip_add_file(_zip
						, _zipnum+"/skin/"+_files[_i]
						, working_directory+"songlist/"+string(global.filelist[global.chart])+"/skin/"+_files[_i]);
					}
				}
				zip_save(_zip, _file);
				chartloading=0;
			}
		}
	}
}
else if chartediting==1{
	if modtype==0 {
		if(global.chartrans==0){
			global.skinnumber[0]=96;
			global.skinnumber[1]=102;
			global.skinnumber[2]=608;
			room_goto(room_chartdesign);
		}
	}
	else if modtype==1 {
		msg = get_integer_async("输入曲名", "");
	}
	else if modtype==2 {
		msg = get_integer_async("输入难度名", "");
	}
	else if modtype==3 {
		msg = get_integer_async("输入难度名", "");
	}
	else if modtype==4{
		if (array_length(global.fileread)<=5) exit;
		if (confirmt==0) confirmt=1;
		else {
			file_delete(working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+".pqc");
			file_delete(working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv.pqc");
			for(var _i=global.level+1;_i*2<array_length(global.fileread)-4;_i++){
				if (file_exists(working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(_i)+".pqc"))
				{
				    file_rename(
						working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(_i)+".pqc",
						working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(_i-1)+".pqc"
					);
				}
				if (file_exists(working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(_i)+"_sv.pqc"))
				{
				    file_rename(
						working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(_i)+"_sv.pqc",
						working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+string(_i-1)+"_sv.pqc"
					);
				}
			}
			
			var _file = file_text_open_write(working_directory + "songlist/"+string(global.filelist[global.chart])+"/main.pqc");
			
			array_delete(global.fileread,global.level*2+3,1);
			array_delete(global.fileread,global.level*2+3,1);
			for(var _i=0;_i<array_length(global.fileread);_i++){
				file_text_write_string(_file, global.fileread[_i]);
				if(_i!=array_length(global.fileread)-1){
					file_text_write_string(_file,"\n");
				}
			}
			file_text_close(_file);
			_file = file_text_open_write(working_directory + "highscore/"+string(global.filelist[global.chart])+".pqc");
			
			global.highscore[global.level]=0;
			array_delete(global.highscore,global.level,1);
			
			var i=0;
			while(i<array_length(global.highscore)){
				file_text_write_string(_file,string_format(global.highscore[i],0,4)+"\n");
				i++;
			}
			file_text_close(_file);
			
			scr_restart();
		}
	}
}

else{
	if array_length(global.filelist)==0 exit;
	if chartrue==0 exit;
	if (global.mirror==1){
		global.press=[real(global.settings[5]),real(global.settings[4]),real(global.settings[3]),real(global.settings[2]),real(global.settings[16]),real(global.settings[15]),real(global.settings[14]),real(global.settings[13])];
	}
	global.chartspeed=[1,1,1,1,1,1];
	global.chartxmove=[0,0,0,0,0,0];
	global.chartspeedtime=[[[1,-10000]],[[1,-10000]],[[1,-10000]],[[1,-10000]],[[1,-10000]],[[1,-10000]]];
	global.chartmoveinspeed=[0,0,0,0,0,0];
	global.chartmoveinglobal=[0,0,0,0,0,0];
	global.rand=[random(0.998),random(0.998),random(0.998),random(0.998)];
	global.pressreal=[0,1,2,3];
	global.globalspeed=global.globalspeed/global.gamespeed;

	global.bloom=[0];
	global.chromatic=[0,1.05];
	
	if(directory_exists(working_directory+"songlist/"+string(global.filelist[global.chart])+"/skin/")){
		
		if(global.settings[9]!=0){
			var _bg=0;
			if(file_exists(working_directory+"songlist/"+string(global.filelist[global.chart])+"/skin/bg.png")){
				_bg=working_directory+"songlist/"+string(global.filelist[global.chart])+"/skin/bg.png";
			}
			else if(file_exists(working_directory+"songlist/"+string(global.filelist[global.chart])+"/skin/bg.jpg")){
				_bg=working_directory+"songlist/"+string(global.filelist[global.chart])+"/skin/bg.jpg";
			}
			
			if(_bg!=0){
				if(string_starts_with(sprite_get_name(global.playskin[69]),"__")){
					var _j=0
					while(_j<array_length(global.playskin)){
						if(global.playskin[69]==global.playskin[_j]
							&&_j!=69){
							break;
						}
						_j++
					}
					if(_j==array_length(global.playskin)){
						sprite_delete(global.playskin[69]);
					}
				}
				global.playskin[69]=sprite_add(_bg,1, false, false, 0,0);
			}
		}
		
		global.lastnum=scr_loadskin("songlist/"+string(global.filelist[global.chart])+"/skin",global.settings[9],global.settings[10])
	}
	else global.lastnum=[array_length(global.playskin)-1,array_length(global.playtext)-1];
	if playtypemod!=0 global.playtype=playtypemod;

	global.chartread=[];
	global.svread=[];
	global.presschangeread=[];
	global.playtime=-2000;
	global.keylist=[0,0,0,0,0,0];
	global.keytouchlist=[0,0,0,0,0,0];
	global.textlist[10]=0;
	global.textlist[11]=0;
	global.textlist[12]=0;
	global.textlist[13]=0;

	room_goto(room_playgame);
}