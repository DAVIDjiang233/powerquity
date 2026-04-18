function readfile(){
	chartrue=0;
	global.fileread=[];
	
	if !(file_exists(working_directory + "songlist/"+string(global.filelist[global.chart])+"/main.pqc")) exit;
	if !(file_exists(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+".pqc")) exit;
	if !(file_exists(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv.pqc")) exit;
	if !(file_exists(working_directory + "songlist/"+string(global.filelist[global.chart])+"/base.ogg")) exit;
	
	if (!file_exists(working_directory + "highscore/"+string(global.filelist[global.chart])+".pqc")){
		var _tempfile = file_text_open_write(working_directory + "highscore/" + string(global.filelist[global.chart]) + ".pqc");
		file_text_write_string(_tempfile,"0");
		file_text_close(_tempfile);
	}
	
	var _file = file_text_open_read(working_directory + "songlist/"+string(global.filelist[global.chart])+"/main.pqc");
	var i=0;
	while (!file_text_eof(_file))
	{
	    global.fileread[i] = file_text_read_string(_file);
		while (global.fileread[i]==""&&!file_text_eof(_file)){
			array_delete(global.fileread,i,1);
			file_text_readln(_file);
			global.fileread[i] = file_text_read_string(_file);
		}
		if (global.fileread[i]=="") array_delete(global.fileread,i,1);
	    file_text_readln(_file);
		i++;
	}
	file_text_close(_file);
	_file = file_text_open_read(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+".pqc");
	global.chartrans=file_text_read_string(_file);
	if(scr_stringtreal(global.chartrans)==1){
		global.chartrans=0;
	}
	else global.chartrans=string_split(global.chartrans,",")[0];
	file_text_readln(_file);
	global.playtype=file_text_read_string(_file);
	file_text_close(_file);
	global.highscore=[];
	if file_exists(working_directory + "highscore/"+string(global.filelist[global.chart])+".pqc"){
		_file = file_text_open_read(working_directory + "highscore/"+string(global.filelist[global.chart])+".pqc");
		i=0;
		while (!file_text_eof(_file))
		{
			var _score=file_text_read_string(_file)
			if(scr_stringtreal(_score)){
				global.highscore[i] = real(_score);
			}
			else{
				global.highscore[i]=0;
			}
		    file_text_readln(_file);
			i++;
		}
		file_text_close(_file);
	}
	else{
		_file = file_text_open_write(working_directory + "highscore/"+string(global.filelist[global.chart])+".pqc");
		file_text_close(_file);
	}
	
	if(array_length(global.highscore)<=global.level){
		i=array_length(global.highscore);
		while(i<=global.level){
			global.highscore[i]=0;
			i++;
		}
	}
	chartrue=1;
}
