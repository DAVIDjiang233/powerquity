var loadfont;
loadfont = get_open_filename("font|*.ttf;*.ttc;*.otf", "");
if (loadfont != "")
{
	if (file_exists(working_directory + "/skin/font.ttf")) file_delete(working_directory + "/skin/font.ttf")
	if (file_exists(working_directory + "/skin/font.ttc")) file_delete(working_directory + "/skin/font.ttc")
	if (file_exists(working_directory + "/skin/font.otf")) file_delete(working_directory + "/skin/font.otf")

	file_copy(loadfont, working_directory + "skin/"+filename_name(loadfont));
	//var q=zip_unzip(loadfont, working_directory + "songlist/");
	scr_restart();
}