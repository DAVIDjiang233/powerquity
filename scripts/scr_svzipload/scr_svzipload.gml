function scr_svzipload(_dir){
	if(file_exists(_dir+"music.ogg")){
		file_rename(_dir+"music.ogg",_dir+"base.ogg");
	}
	if(file_exists(_dir+"jacket.png")){
		if (!directory_exists(_dir + "/skin"))
		{
		    directory_create(_dir + "/skin");
		}
		file_rename(_dir+"jacket.png",_dir+"skin/bg.png");
	}
	else if(file_exists(_dir+"jacket.jpg")){
		if (!directory_exists(_dir + "/skin"))
		{
		    directory_create(_dir + "/skin");
		}
		file_rename(_dir+"jacket.jpg",_dir+"skin/bg.jpg");
	}
	var _file = file_text_open_read(_dir+"info.json");
	var i=0;
	var _fileread="";
	while (!file_text_eof(_file))
	{
		_fileread += file_text_read_string(_file);
		file_text_readln(_file);
		i++;
	}
	file_text_close(_file);
	_fileread=json_parse(_fileread);
	
	if(_fileread.name==""){
		if(_fileread.formatted_name!=""){
			_fileread.name=_fileread.formatted_name;
		}
		else if(_fileread.chart_id!=""){
			_fileread.name=_fileread.chart_id;
		}
		else{
			_fileread.name="gunmu";
		}
	}
	if(_fileread.artist=="") _fileread.artist="gunmu"
	if(_fileread.bpm_display=="") _fileread.bpm_display="120"
	
	_file=file_text_open_write(_dir + "main.pqc");
	file_text_write_string(_file,_fileread.name+"\n"+_fileread.artist+"\n"+_fileread.bpm_display+"\n");
	
	var _diff=0;
	var _musicplay = audio_create_stream(_dir+"base.ogg");
	
	if(file_exists(_dir+"Opening.vsc")){
		file_rename(_dir+"Opening.vsc",_dir+"OPENING.vsc");
	}
	else if(file_exists(_dir+"opening.vsc")){
		file_rename(_dir+"opening.vsc",_dir+"OPENING.vsc");
	}
	if(file_exists(_dir+"OPENING.vsc")){
		if(_fileread.note_designer_1==""){
			_fileread.note_designer_1="gunmu"
		}
		file_text_write_string(_file,_fileread.note_designer_1+"\nOpening "+_fileread.difficulty_display_1);
		var _filechart = file_text_open_write(_dir + string(_diff)+".pqc");
		file_text_write_string(_filechart,"sv2,OPENING.vsc\n1");
		file_text_close(_filechart);
		_filechart = file_text_open_write(_dir + string(_diff) + "_sv.pqc");
		file_text_write_string(_filechart,"E,"+string(ceil(audio_sound_length(_musicplay)*1000)));
		file_text_close(_filechart);
		_diff++;
	}
	if(file_exists(_dir+"Middle.vsc")){
		file_rename(_dir+"Middle.vsc",_dir+"MIDDLE.vsc");
	}
	else if(file_exists(_dir+"middle.vsc")){
		file_rename(_dir+"middle.vsc",_dir+"MIDDLE.vsc");
	}
	if(file_exists(_dir+"MIDDLE.vsc")){
		if(_fileread.note_designer_2==""){
			_fileread.note_designer_2="gunmu"
		}
		file_text_write_string(_file,_fileread.note_designer_2+"\nMiddle "+_fileread.difficulty_display_2);
		var _filechart = file_text_open_write(_dir + string(_diff)+".pqc");
		file_text_write_string(_filechart,"sv2,MIDDLE.vsc\n1");
		file_text_close(_filechart);
		_filechart = file_text_open_write(_dir + string(_diff) + "_sv.pqc");
		file_text_write_string(_filechart,"E,"+string(ceil(audio_sound_length(_musicplay)*1000)));
		file_text_close(_filechart);
		_diff++;
	}
	if(file_exists(_dir+"Finale.vsc")){
		file_rename(_dir+"Finale.vsc",_dir+"FINALE.vsc");
	}
	else if(file_exists(_dir+"finale.vsc")){
		file_rename(_dir+"finale.vsc",_dir+"FINALE.vsc");
	}
	if(file_exists(_dir+"FINALE.vsc")){
		if(_fileread.note_designer_2==""){
			_fileread.note_designer_2="gunmu"
		}
		file_text_write_string(_file,_fileread.note_designer_2+"\nFinale "+_fileread.difficulty_display_2);
		var _filechart = file_text_open_write(_dir + string(_diff)+".pqc");
		file_text_write_string(_filechart,"sv2,FINALE.vsc\n1");
		file_text_close(_filechart);
		_filechart = file_text_open_write(_dir + string(_diff) + "_sv.pqc");
		file_text_write_string(_filechart,"E,"+string(ceil(audio_sound_length(_musicplay)*1000)));
		file_text_close(_filechart);
		_diff++;
	}
	if(file_exists(_dir+"Encore.vsc")){
		file_rename(_dir+"Encore.vsc",_dir+"ENCORE.vsc");
	}
	else if(file_exists(_dir+"encore.vsc")){
		file_rename(_dir+"encore.vsc",_dir+"ENCORE.vsc");
	}
	if(file_exists(_dir+"ENCORE.vsc")){
		if(_fileread.note_designer_2==""){
			_fileread.note_designer_2="gunmu"
		}
		file_text_write_string(_file,_fileread.note_designer_2+"\nEncore "+_fileread.difficulty_display_2);
		var _filechart = file_text_open_write(_dir + string(_diff)+".pqc");
		file_text_write_string(_filechart,"sv2,ENCORE.vsc\n1");
		file_text_close(_filechart);
		_filechart = file_text_open_write(_dir + string(_diff) + "_sv.pqc");
		file_text_write_string(_filechart,"E,"+string(ceil(audio_sound_length(_musicplay)*1000)));
		file_text_close(_filechart);
		_diff++;
	}
	file_text_close(_file);
	audio_destroy_stream(_musicplay);
}