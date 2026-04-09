if changekey==1 exit;
var _file = file_text_open_write(working_directory + "settings.txt");
var _q=0;
while(_q<array_length(global.settings)){
	file_text_write_string(_file,string(global.settings[_q]));
	_q++;
	if _q<array_length(global.settings) file_text_write_string(_file,"\n");
}
file_text_close(_file);

scr_restart();

