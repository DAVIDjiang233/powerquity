
var i_d = ds_map_find_value(async_load, "id");
if (i_d == msg)
{
    if (ds_map_find_value(async_load, "status"))
    {
        if (ds_map_find_value(async_load, "result") != "")
        {
			
			var _num=ds_map_find_value(async_load, "result");
			if (type<=2){
				global.fileread[type]=_num;
			}
			else{
				global.fileread[global.level*2+type]=_num;
			}
			var _file = file_text_open_write(working_directory + "songlist/"+string(global.filelist[global.chart])+"/main.pqc");
			for(var _i=0;_i<array_length(global.fileread);_i++){
				file_text_write_string(_file, global.fileread[_i]);
				if(_i!=array_length(global.fileread)-1){
					file_text_write_string(_file,"\n");
				}
			}
			file_text_close(_file);
        }
    }
}
