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
		loadchart = get_open_filename("powerquity chart file|*.pqp;*.zip", "");
		if (loadchart != "")
			{
			    var q=zip_unzip(loadchart, working_directory + "songlist/");
				game_restart();
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
			game_restart();
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

			game_restart();
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

			game_restart();
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
						
				zip_save(_zip, _file);
				chartloading=0;
			}
		}
	}
}
else if chartediting==1{
	if modtype==0 {
		room_goto(room_chartdesign);
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
			
			game_restart();
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
	global.pressreal=[ord("0"),ord("1"),ord("2"),ord("3"),ord("4"),ord("5")];
	global.globalspeed=global.globalspeed/global.gamespeed;

	global.bloom=[0];
	global.chromatic=[0,1.05];
	
	if playtypemod!=0 global.playtype=playtypemod;

	global.chartread=[];
	global.svread=[];
	global.presschangeread=[];
	global.playtime=-2000;
	global.keylist=[0,0,0,0,0,0];
	global.keytouchlist=[0,0,0,0,0,0];
	global.judgelist=[0,0,0,0];

	room_goto(room_playgame);
}