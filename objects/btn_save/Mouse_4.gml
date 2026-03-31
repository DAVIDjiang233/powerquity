if (!file_exists(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_Old.pqc"))
{
	if (file_exists(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+".pqc"))
	{
		file_copy(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+".pqc", working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_Old.pqc");
	}
}
if (!file_exists(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv_Old.pqc"))
{
	if (file_exists(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv.pqc"))
	{
		file_copy(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv.pqc", working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv_Old.pqc");
	}
}
if (!file_exists(working_directory + "songlist/"+string(global.filelist[global.chart])+"/bpmlist_Old.pqc"))
{
	if (file_exists(working_directory + "songlist/"+string(global.filelist[global.chart])+"/bpmlist.pqc"))
	{
		file_copy(working_directory + "songlist/"+string(global.filelist[global.chart])+"/bpmlist.pqc", working_directory + "songlist/"+string(global.filelist[global.chart])+"/bpmlist_Old.pqc");
	}
}

scr_savechart(
	working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+".pqc",
	working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv.pqc",
	working_directory + "songlist/"+string(global.filelist[global.chart])+"/bpmlist.pqc"
);