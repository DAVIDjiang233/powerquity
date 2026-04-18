game_set_speed(global.settings[17], gamespeed_fps);
audio_stop_all();
timingdelay=real(global.settings[6])*global.gamespeed;
var i = 0;
depth=-5000;
startime=current_time+9999999;
pausetime=0;
gamepause=0;
alarmpause=-999999;
global.timingcnt=0;
global.tapcnt=0;
autopress=[[],[],[],[]];
autopress2=[[],[],[],[]];
autorelease=[[],[],[],[]];
autocooldown=[-5000,-5000,-5000,-5000];
global.maxel=[2880,-2880];

global.taptiming=[[-5,-5],[-5,-5],[-5,-5],[-5,-5]];
global.effecttiming=[0,0,0,0];
global.holdreleasetiming=[[-5,-5],[-5,-5],[-5,-5],[-5,-5]];
global.releasetiming=[[25,25],[25,25],[25,25],[25,25]];
global.cooldowntiming=[[-5,-5],[-5,-5],[-5,-5],[-5,-5]];
/*

global.taptiming=[[-55,45],[-55,45],[-55,45],[-55,45]];
global.effecttiming=[60,60,40,50];
global.holdreleasetiming=[[-25,40],[-25,40],[-25,40],[-25,40]];
global.releasetiming=[[45,100],[45,95],[45,85],[45,90]];
global.cooldowntiming=[[30,60],[30,60],[30,60],[30,60]];

global.taptiming=[[-40,40],[-40,40],[-40,40],[-40,40]];
global.releasetiming=[[25,75],[25,75],[25,75],[25,75]];
global.effecttiming=[20,20,20,20];
global.holdreleasetiming=[[-25,40],[-25,40],[-25,40],[-25,40]];
global.cooldowntiming=[[25,50],[25,50],[25,50],[25,50]];

/*
global.taptiming=[[-6,-5],[-6,-5],[-6,-5],[-6,-5]];
global.releasetiming=[[7000,9000],[7000,9000],[7000,9000],[7000,9000]];
global.cooldowntiming=[[6000,8000],[6000,8000],[6000,8000],[6000,8000]];
*/

var _file = file_text_open_read(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+".pqc");
delay=file_text_read_string(_file);
if(scr_stringtreal(delay)==1){
	delay=floor(-real(delay));
	file_text_readln(_file);

	if (global.mirror==1&&!instance_exists(shad_mirror)){
		instance_create_depth(114,514,-9999,shad_mirror);
	}
	if global.playtype==2 keyboard_key_press(ord("1"));

	if (global.autoplay==1) global.judgesize=0.001;
	else if(global.autoplay==2){
		keyboard_key_release(global.pressreal[1]);
		keyboard_key_release(global.pressreal[2]);
		keyboard_key_release(global.pressreal[3]);
		keyboard_key_release(global.pressreal[4]);
	}

	file_text_readln(_file);
	while (!file_text_eof(_file))
	{
	    global.chartread[i] = string_split(file_text_read_string(_file),",");
		while (global.chartread[i][0]==""&&!file_text_eof(_file)){
			array_delete(global.chartread,i,1);
			file_text_readln(_file);
			global.chartread[i] = string_split(file_text_read_string(_file),",");
		}
		if (global.chartread[i][0]=="") {array_delete(global.chartread,i,1);
			i--;
			}
	    file_text_readln(_file);
		i++;
	}
}
else{
	delay=string_split(delay,",")
	if(delay[0]="sv"){
		global.chartread=scr_sv2pqc(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+delay[1]);
	}
	delay=0;
}
file_text_close(_file);


array_sort(global.chartread,function(elm1, elm2){
	if real(elm1[1])>real(elm2[1]) return 1;
	else if real(elm1[1])<real(elm2[1]) return -1;
	else if elm1[0]="L" return 1;
	else return -1;
});

show_debug_message(global.chartread);


i = 0;
_file = file_text_open_read(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv.pqc");
while (!file_text_eof(_file))
{
    global.svread[i] = string_split(file_text_read_string(_file),",");
	while (global.svread[i][0]==""&&!file_text_eof(_file)){
		array_delete(global.svread,i,1);
		file_text_readln(_file);
		global.svread[i] = string_split(file_text_read_string(_file),",");
	}
	if (global.svread[i][0]=="") {
		array_delete(global.svread,i,1);
		i--;
	}
	else if (global.svread[i][0]=="SC") {
		while(array_length(global.chartspeedtime)<=global.svread[i][3]){
			array_insert(global.chartspeedtime,array_length(global.chartspeedtime),[]);
		}
		array_insert(global.chartspeedtime[global.svread[i][3]],0,[real(global.svread[i][2]),real(global.svread[i][1])]);
		if (global.svenable==0){
			global.chartspeedtime[global.svread[i][3]][0][0]=1;
		}
		
		array_delete(global.svread,i,1);
		i--;
	}
	else if (global.svread[i][0]=="FS") {
		while(array_length(global.chartspeedtime)<=global.svread[i][2]){
			array_insert(global.chartspeedtime,array_length(global.chartspeedtime),[]);
		}
		array_insert(global.chartspeedtime[global.svread[i][2]],0,[1,real(global.svread[i][1])]);
	}
    file_text_readln(_file);
	i++;
}
file_text_close(_file);
//show_debug_message(global.svread)

array_sort(global.svread,function(elm1, elm2){
	return real(elm1[1])-real(elm2[1]);
});
i = 0;
while(i<array_length(global.chartspeedtime)){
	array_sort(global.chartspeedtime[i],function(elm1, elm2){
		return real(elm1[1])-real(elm2[1]);
	});
i++;
}

//show_debug_message(global.svread);


//show_debug_message(string(global.rand));
musicplay=audio_create_stream(working_directory + "songlist/"+string(global.filelist[global.chart])+"/base.ogg");


startime=current_time;

