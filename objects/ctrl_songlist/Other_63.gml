
var i_d = ds_map_find_value(async_load, "id");
if (i_d == msg)
{
    if (ds_map_find_value(async_load, "status"))
    {
        if (ds_map_find_value(async_load, "result") != "")
        {
			var _num=ds_map_find_value(async_load, "result");
			if (array_length(global.filelist)==0) {
				var _basename=string_lettersdigits(_num);
				if(_basename==""){
					_basename=string(floor(date_second_span(date_create_datetime(2020, 1, 1, 0, 0, 0 ), date_current_datetime())));
				}
				if (!directory_exists(working_directory + "songlist/" + _basename)){
					var loadsound;
					loadsound = get_open_filename("音频文件|*.ogg", "");
					if (loadsound != "")
					{
						var _musicplay = audio_create_stream(loadsound);
				
						directory_create(working_directory + "songlist/" + _basename);
						file_copy(loadsound, working_directory + "songlist/" + _basename + "/base.ogg");
						
						var _tempfile = file_text_open_write(working_directory + "songlist/" + _basename + "/0.pqc");
						file_text_write_string(_tempfile,"0\n1");
						file_text_close(_tempfile);
						_tempfile = file_text_open_write(working_directory + "songlist/" + _basename + "/0_sv.pqc");
						file_text_write_string(_tempfile,"E,"+string(ceil(audio_sound_length(_musicplay)*1000)));
						file_text_close(_tempfile);
						_tempfile = file_text_open_write(working_directory + "songlist/" + _basename + "/main.pqc");
						file_text_write_string(_tempfile,_num+"\n曲师\nBPM但是可以随便填\n谱师\n难度");
						file_text_close(_tempfile);
				
						game_restart();
				
					}
				}
			}
			else if chartloading==1{
				if (modtype==5) {
					var _basename=string_lettersdigits(_num);
					if(_basename=="") exit;
					if(array_length(string_split(global.filelist[global.chart],"."))>1){
						_basename=_basename+"."+string_split(global.filelist[global.chart],".")[1];
					}
					if(array_contains(global.filelist,_basename)) exit;
					directory_create(working_directory+"songlist/"+_basename);
					var _files = [];
					var _file_name = file_find_first(working_directory+"songlist/"+string(global.filelist[global.chart])+"/*.pqc", 0);

					while (_file_name != "")
					{
					    array_push(_files, _file_name);
					    _file_name = file_find_next();
					}
					//show_debug_message(_files);
					file_rename(
					working_directory+"highscore/"+string(global.filelist[global.chart])+".pqc",
					working_directory+"highscore/"+_basename+".pqc"
					);
					file_rename(
					working_directory+"songlist/"+string(global.filelist[global.chart])+"/base.ogg",
					working_directory+"songlist/"+_basename+"/base.ogg"
					);
					for(var _i=0;_i<array_length(_files);_i++){
						file_rename(
						working_directory+"songlist/"+string(global.filelist[global.chart])+"/"+_files[_i],
						working_directory+"songlist/"+_basename+"/"+_files[_i]
						);
					}
					directory_destroy(working_directory+"songlist/"+string(global.filelist[global.chart]));
					game_restart();
				
				}
				if (modtype==6) {
					var _basename=string_lettersdigits(_num);
					if(_basename=="") exit;
					
					var _zipnum=string_split(global.filelist[global.chart],".")[0]+"."+_basename;
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
						zip_add_file(_zip
							, _zipnum+"/base.ogg"
							, working_directory+"songlist/"+string(global.filelist[global.chart])+"/base.ogg");
						
						zip_add_file(_zip
							, _zipnum+"/main.pqc"
							, working_directory+"songlist/"+string(global.filelist[global.chart])+"/main.pqc");
						
						zip_add_file(_zip
							, _zipnum+"/bpmlist.pqc"
							, working_directory+"songlist/"+string(global.filelist[global.chart])+"/bpmlist.pqc");
						
						zip_save(_zip, _file);
						
						chartloading=0;
					}
					
				}
			}
			else if (chartediting==1){
				if (modtype==1) {
					var _basename=string_lettersdigits(_num);
					if(_basename==""){
						_basename=string(floor(date_second_span(date_create_datetime(2020, 1, 1, 0, 0, 0 ), date_current_datetime())));
					}
					if (!directory_exists(working_directory + "songlist/" + _basename)){
						var loadsound;
						loadsound = get_open_filename("音频文件|*.ogg", "");
						if (loadsound != "")
						{
							var _musicplay = audio_create_stream(loadsound);
				
							directory_create(working_directory + "songlist/" + _basename);
							file_copy(loadsound, working_directory + "songlist/" + _basename + "/base.ogg");
						
							var _tempfile = file_text_open_write(working_directory + "songlist/" + _basename + "/0.pqc");
							file_text_write_string(_tempfile,"0\n1");
							file_text_close(_tempfile);
							_tempfile = file_text_open_write(working_directory + "songlist/" + _basename + "/0_sv.pqc");
							file_text_write_string(_tempfile,"E,"+string(ceil(audio_sound_length(_musicplay)*1000)));
							file_text_close(_tempfile);
							_tempfile = file_text_open_write(working_directory + "songlist/" + _basename + "/main.pqc");
							file_text_write_string(_tempfile,_num+"\n曲师\nBPM但是可以随便填\n谱师\n难度");
							file_text_close(_tempfile);
				
							game_restart();
				
						}
					}
				}
				else if (modtype==2) {
					var _file = file_text_open_write(working_directory + "songlist/"+string(global.filelist[global.chart])+"/main.pqc");
					var _chartid=(array_length(global.fileread)-3)/2;
					
					global.fileread[array_length(global.fileread)]="谱师";
					global.fileread[array_length(global.fileread)]=_num;
					for(var _i=0;_i<array_length(global.fileread);_i++){
						file_text_write_string(_file, global.fileread[_i]);
						if(_i!=array_length(global.fileread)-1){
							file_text_write_string(_file,"\n");
						}
					}
					file_text_close(_file);
					var _musicplay = audio_create_stream(working_directory + "songlist/"+string(global.filelist[global.chart])+"/base.ogg");
					
					var _tempfile = file_text_open_write(working_directory + "songlist/" + string(global.filelist[global.chart]) + "/"+string(_chartid)+".pqc");
					file_text_write_string(_tempfile,"0\n1");
					file_text_close(_tempfile);
					_tempfile = file_text_open_write(working_directory + "songlist/" + string(global.filelist[global.chart]) + "/"+string(_chartid)+"_sv.pqc");
					file_text_write_string(_tempfile,"E,"+string(ceil(audio_sound_length(_musicplay)*1000)));
					file_text_close(_tempfile);
							
					
					game_restart();
				}
				else if (modtype==3) {
					var _file = file_text_open_write(working_directory + "songlist/"+string(global.filelist[global.chart])+"/main.pqc");
					var _chartid=(array_length(global.fileread)-3)/2;
					global.fileread[array_length(global.fileread)]=string(global.fileread[global.level*2+3]);
					global.fileread[array_length(global.fileread)]=_num;
					for(var _i=0;_i<array_length(global.fileread);_i++){
						file_text_write_string(_file, global.fileread[_i]);
						if(_i!=array_length(global.fileread)-1){
							file_text_write_string(_file,"\n");
						}
					}
					file_text_close(_file);
					
					file_copy(working_directory + "songlist/" + string(global.filelist[global.chart]) + "/"+string(global.level)+".pqc", working_directory + "songlist/" + string(global.filelist[global.chart]) + "/"+string(_chartid)+".pqc");
					file_copy(working_directory + "songlist/" + string(global.filelist[global.chart]) + "/"+string(global.level)+"_sv.pqc", working_directory + "songlist/" + string(global.filelist[global.chart]) + "/"+string(_chartid)+"_sv.pqc");
					
							
					
					
					game_restart();
				}
			}
		}
	}
}