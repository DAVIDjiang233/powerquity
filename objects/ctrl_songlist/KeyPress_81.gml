var loadfont;
loadfont = get_open_filename("font|*.ttf;*.ttc;*.otf", "");
if (loadfont != "")
{
	file_copy(loadfont, working_directory + "skin/"+filename_name(loadfont));
	//var q=zip_unzip(loadfont, working_directory + "songlist/");
	game_restart();
}