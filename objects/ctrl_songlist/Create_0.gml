game_set_speed(60, gamespeed_fps);
depth=-8266;
global.gamespeed=1;
global.settings=[];
global.scored=1;
global.svenable=1;
global.judgesize=1;
global.mirror=0;
global.autoplay=0;

if file_exists(working_directory + "settings.txt"){
	var _file = file_text_open_read(working_directory + "settings.txt");
	var i=0;
	while (!file_text_eof(_file))
	{
		global.settings[i] = real(file_text_read_string(_file));
		file_text_readln(_file);
		i++;
	}
	file_text_close(_file);
}
else{
	var _file = file_text_open_write(working_directory + "settings.txt");
	file_text_write_string(_file,"5\n4\n83\n68\n74\n75\n0\n1\n174\n352\n672\n1\n0\n83\n68\n74\n75\n240\n82\n80")
	file_text_close(_file);
	global.settings=[5,4,83,68,74,75,0,1,174,352,672,1,0,83,68,74,75,240,82,80];
}
if window_get_width()==1280{
	window_set_size(320*real(global.settings[1]), 184*real(global.settings[1]));
	window_set_position(window_get_x()-160*(real(global.settings[1])-4),window_get_y()-92*(real(global.settings[1])-4));
}
global.globalspeed=real(global.settings[0]);
global.mirror=real(global.settings[12]);
global.press=[real(global.settings[2]),real(global.settings[3]),real(global.settings[4]),real(global.settings[5]),real(global.settings[13]),real(global.settings[14]),real(global.settings[15]),real(global.settings[16])];
global.pressreal=[ord("0"),ord("1"),ord("2"),ord("3"),ord("4"),ord("5")];
global.pressext=[real(global.settings[18]),real(global.settings[19])];
randomise();
if (!directory_exists(working_directory + "/songlist"))
{
    directory_create(working_directory + "/songlist");
}
if (!directory_exists(working_directory + "/highscore"))
{
    directory_create(working_directory + "/highscore");
}
if (!directory_exists(working_directory + "/skin"))
{
    directory_create(working_directory + "/skin");
}

if (file_exists(working_directory + "/skin/font.ttf")) global.fontall=font_add(working_directory + "/skin/font.ttf",72,0,0,32,128);
else if (file_exists(working_directory + "/skin/font.ttc")) global.fontall=font_add(working_directory + "/skin/font.ttc",72,0,0,32,128);
else if (file_exists(working_directory + "/skin/font.otf")) global.fontall=font_add(working_directory + "/skin/font.otf",72,0,0,32,128);
else global.fontall=font_add("deng",72,0,0,32,128);

{
	global.playskin=[
	spr_tap,spr_tap,spr_tap,spr_tap,
	spr_touchap,spr_touchap,spr_touchap,spr_touchap,
	spr_misstap,spr_misstap,spr_misstap,spr_misstap,
	spr_fakekey,
	spr_bumper,spr_bumper,spr_bumper,
	spr_triper,spr_triper,
	spr_quader,
	spr_fakeln,
	spr_tap,spr_tap,spr_tap,spr_tap,
	spr_lnkey,spr_lnkey,spr_lnkey,spr_lnkey,
	gunmu,gunmu,gunmu,gunmu,
	spr_endtap,spr_endtap,spr_endtap,spr_endtap,
	spr_backban,
	spr_grondboard,spr_grondboard,spr_grondboard,spr_grondboard,
	spr_grondboard,spr_grondboard,spr_grondboard,spr_grondboard,
	spr_grondboard,spr_grondboard,spr_grondboard,spr_grondboard,
	spr_grondboard,spr_grondboard,spr_grondboard,spr_grondboard,
	spr_grondboard,spr_grondboard,spr_grondboard,spr_grondboard,
	spr_grondboard,spr_grondboard,spr_grondboard,spr_grondboard,
	spr_grondboard,spr_grondboard,spr_grondboard,spr_grondboard,
	spr_grondboard,spr_grondboard,spr_grondboard,spr_grondboard,
	96,102,608,
	#ff6666,#ff9966,#66cc66,#6666ff,#ff3333,#ff7733,#33aa33,#3333ff,
	#440000,#442200,#003300,#000044,#ff0000,#ff9900,#00cc00,#0000ff,#ff0000,#ffff00,#00ff00,#0000ff,
	spr_presschange,spr_presschange,spr_presschange,spr_presschange,
	spr_presschange,spr_presschange,spr_presschange,spr_presschange,
	spr_presschange,spr_presschange,spr_presschange,spr_presschange,
	spr_presschange,spr_presschange,spr_presschange,spr_presschange,
	spr_tap_judge,spr_tap_judge,spr_tap_judge,spr_tap_judge,
	spr_bumper_judge,spr_bumper_judge,spr_bumper_judge,
	spr_triper_judge,spr_triper_judge,
	spr_quader_judge,
	spr_tap_judge,spr_tap_judge,spr_tap_judge,spr_tap_judge,
	spr_lnkey,spr_lnkey,spr_lnkey,spr_lnkey,
	gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,
	gunmu,gunmu,
	gunmu,gunmu,
	gunmu,gunmu,
	gunmu,
	gunmu,
	gunmu,
	gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,
	gunmu,gunmu,
	gunmu,gunmu,
	gunmu,gunmu,
	gunmu,
	gunmu,
	gunmu,
	spr_lightoff,spr_lighton,
	gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,
	
	gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,gunmu,
	
	gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,gunmu,
	
	gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,gunmu,
	
	gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,gunmu,
	
	gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,
	
	gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,
	
	gunmu,gunmu,
	gunmu,gunmu,
	
	gunmu,gunmu,
	gunmu,gunmu,
	gunmu,gunmu,
	gunmu,gunmu,
	gunmu,gunmu,
	
	gunmu,
	gunmu,
	
	gunmu,
	gunmu,
	gunmu,
	gunmu,
	gunmu,
	
	gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,gunmu,
	
	gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,gunmu,
	
	gunmu,gunmu,gunmu,gunmu,
	
	gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,gunmu,
	
	gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,gunmu,
	
	gunmu,gunmu,gunmu,gunmu,
	
	gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,gunmu,
	
	gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,
	
	gunmu,gunmu,gunmu,
	
	gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,
	
	gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,
	
	gunmu,gunmu,gunmu,
	
	gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,
	
	gunmu,gunmu,
	gunmu,gunmu,
	
	gunmu,gunmu,
	
	gunmu,gunmu,
	gunmu,gunmu,
	
	gunmu,gunmu,
	gunmu,gunmu,
	gunmu,gunmu,
	gunmu,gunmu,
	gunmu,gunmu,
	
	gunmu,gunmu,
	
	gunmu,gunmu,
	gunmu,gunmu,
	
	gunmu,gunmu,gunmu,gunmu,gunmu,
	gunmu,gunmu,gunmu,gunmu,gunmu,gunmu,gunmu,gunmu,
	60
	];
}

//show_debug_message(array_length(global.playskin));
scr_loadskin("");
//show_debug_message(array_length(global.playskin));
//show_debug_message(global.playskin[260])
global.fileread=[];
global.filelist=[];
global.highscore=[];
global.chart=0;
global.level=0;
var _amon=0;
	if (directory_exists(working_directory + "\songlist"))
	{
		
	    global.filelist[_amon] = file_find_first(working_directory + "/songlist/*", fa_directory);
		while(global.filelist[_amon]!=""){
			_amon++;
			global.filelist[_amon] = file_find_next();
		}
	    file_find_close();
		array_delete(global.filelist, -1, 1);
	}
	
_amon=0;
while(_amon<array_length(global.filelist)){
	if !file_attributes(working_directory + "/songlist/"+global.filelist[_amon], fa_directory){
		file_delete(working_directory + "/songlist/"+global.filelist[_amon]);
		array_delete(global.filelist, _amon, 1);
	}
	else _amon++;
}
	
if array_length(global.filelist)==0 exit;
readfile();

msg=0;