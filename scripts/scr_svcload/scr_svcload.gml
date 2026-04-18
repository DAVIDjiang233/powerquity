function scr_svcload(_dir){
	file_rename(_dir+file_find_first(_dir+"*.ogg",0),_dir+"base.ogg");
	var _file = file_text_open_read(_dir+"vs-chart.json");
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
	
	if(_fileread.song.name=="") _fileread.song.name="gunmu"
	if(_fileread.song.composer=="") _fileread.song.composer="gunmu"
	
	_file=file_text_open_write(_dir + "main.pqc");
	file_text_write_string(_file,_fileread.song.name+"\n"+_fileread.song.composer+"\n"+string(_fileread.song.bpm)+"\n");
	
	for(var _i=0;_i<array_length(_fileread.diffs);_i++){
		file_text_write_string(_file,_fileread.diffs[_i].meta.charter+"\n"+_fileread.diffs[_i].meta.diff1+" "+_fileread.diffs[_i].meta.diff2);
		if(_i<array_length(_fileread.diffs)-1) file_text_write_string(_file,"\n");
	}
	file_text_close(_file);
	_file = file_text_open_write(_dir + "0.pqc");
	file_text_write_string(_file,"sv,vs-chart.json\n1");
	file_text_close(_file);
	var _musicplay = audio_create_stream(_dir+"base.ogg");
	_file = file_text_open_write(_dir + "0_sv.pqc");
	file_text_write_string(_file,"E,"+string(ceil(audio_sound_length(_musicplay)*1000)));
	file_text_close(_file);
}