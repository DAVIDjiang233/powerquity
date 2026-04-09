if array_length(global.filelist)==0 {
	var loadchart;
		loadchart = get_open_filename("powerquity chart file|*.pqp;*.zip", "");
		if (loadchart != "")
			{
			    var q=zip_unzip(loadchart, working_directory + "songlist/");
				scr_restart();
			}

}
if moding==1 exit;
if chartediting==1 exit;
if chartloading==0 {
	modtype=0;
	chartloading=1;
}
else {
	chartloading=0;
}