settingall=[5,3,6,3];
skinlist=["Default"];
var _file = file_text_open_read(working_directory + "/skin/settings.txt");
var _usingskin = file_text_readln(_file);
file_text_close(_file);
if (directory_exists(working_directory + "/skin"))
{
	array_push(skinlist,file_find_first(working_directory + "/skin/*", fa_directory));
	while(array_last(skinlist)!=""){
		if(filename_ext(array_last(skinlist))!=""){
			array_pop(skinlist);
		}
		array_push(skinlist,file_find_next());
	}
	file_find_close();
	array_pop(skinlist);
}
usingskinnum=array_get_index(skinlist,_usingskin);
if(usingskinnum<0){
	usingskinnum=0;
}
