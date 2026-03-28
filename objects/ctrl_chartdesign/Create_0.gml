
game_set_speed(global.settings[17], gamespeed_fps);
while(lastmin<current_time/300000) lastmin++;
global.chartread=[];
global.cancelchart=[];
global.cancelsv=[];
global.playtime=0;
global.list=0;
global.musicspeed=1;
global.barlist=[];
global.barline=4;
global.choose=[];
global.copy=[];
global.svchoose=[[],[],[],[],[],[],[],[],[],[]];
global.rand=[0,0,0,0];
global.svchange=[[],[],[],[],[],[],[],[],[],[]];

global.chartspeed=[1,1,1,1,1,1];
global.chartxmove=[0,0,0,0,0,0];
global.chartmoveinspeed=[0,0,0,0,0,0];
global.chartmoveinglobal=[0,0,0,0,0,0];

global.svchange[0]=[[],[],[],[],[],[]];

global.svchange[5]=[[],[],[],[],[],[]];
global.svchange[8]=[[],[],[],[],[],[]];
global.svchange[6]=[[],[],[],[],[],[]];
global.svchange[7]=[[],[],[],[],[],[]];

global.svchange[1]=[[],[],[],[],[],[]];
global.svchange[4]=[[],[],[],[],[],[]];
global.svchange[2]=[[],[],[],[],[],[]];
global.svchange[3]=[[],[],[],[],[],[]];

global.svchange[9]=[];

if(scr_stringtreal(global.fileread[2])==1) global.bpmlist=[[0,real(global.fileread[2])]];
else global.bpmlist=[[0,200]];


global.mousetime=0;

global.notetype=["T","LN"];
global.mouseonbtn=0;

musicplay=audio_create_stream(working_directory + "songlist/"+string(global.filelist[global.chart])+"/base.ogg");

global.musictime=audio_sound_length(musicplay)*1000;

var _file = file_text_open_read(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+".pqc");
delay=file_text_read_string(_file);
delay=floor(-real(delay));
file_text_readln(_file);
gametype=file_text_read_string(_file);
gametype=real(gametype);
file_text_readln(_file);

var i = 0;

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
file_text_close(_file);

array_sort(global.chartread,function(elm1, elm2){
	if real(elm1[1])>real(elm2[1]) return 1;
	else if real(elm1[1])<real(elm2[1]) return -1;
	else if elm1[0]="L" return 1;
	else return -1;
});


_file = file_text_open_read(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv.pqc");
while (!file_text_eof(_file))
{
    var _sv = string_split(file_text_read_string(_file),",");
	while (_sv[0]==""&&!file_text_eof(_file)){
		file_text_readln(_file);
		_sv = string_split(file_text_read_string(_file),",");
	}
	if (_sv[0]!="") {
		if(_sv[0]=="S"){
			if(array_length(global.svchange[5])<=real(_sv[4])){
				for(var _i=array_length(global.svchange[5]);_i<=real(_sv[4]);_i++;){
					global.svchange[5][_i]=[];
				}
			}
			array_push(global.svchange[5][real(_sv[4])],[real(_sv[1]),real(_sv[2]),real(_sv[3]),real(_sv[5])]);
		}
		else if(_sv[0]=="M"){
			if(array_length(global.svchange[6])<=real(_sv[4])){
				for(var _i=array_length(global.svchange[6]);_i<=real(_sv[4]);_i++;){
					global.svchange[6][_i]=[];
				}
			}
			array_push(global.svchange[6][real(_sv[4])],[real(_sv[1]),real(_sv[2]),real(_sv[3]),real(_sv[5])]);
		}
		else if(_sv[0]=="MG"){
			if(array_length(global.svchange[7])<=real(_sv[4])){
				for(var _i=array_length(global.svchange[7]);_i<=real(_sv[4]);_i++;){
					global.svchange[7][_i]=[];
				}
			}
			array_push(global.svchange[7][real(_sv[4])],[real(_sv[1]),real(_sv[2]),real(_sv[3]),real(_sv[5])]);
		}
		else if(_sv[0]=="X"){
			if(array_length(global.svchange[8])<=real(_sv[4])){
				for(var _i=array_length(global.svchange[8]);_i<=real(_sv[4]);_i++;){
					global.svchange[8][_i]=[];
				}
			}
			array_push(global.svchange[8][real(_sv[4])],[real(_sv[1]),real(_sv[2]),real(_sv[3]),real(_sv[5])]);
		}
		else if(_sv[0]=="SN"){
			if(array_length(global.svchange[1])<=real(_sv[3])){
				for(var _i=array_length(global.svchange[1]);_i<=real(_sv[3]);_i++;){
					global.svchange[1][_i]=[];
				}
			}
			array_push(global.svchange[1][real(_sv[3])],[real(_sv[1]),real(_sv[2])]);
		}
		else if(_sv[0]=="MN"){
			if(array_length(global.svchange[2])<=real(_sv[3])){
				for(var _i=array_length(global.svchange[2]);_i<=real(_sv[3]);_i++;){
					global.svchange[2][_i]=[];
				}
			}
			array_push(global.svchange[2][real(_sv[3])],[real(_sv[1]),real(_sv[2])]);
		}
		else if(_sv[0]=="MGN"){
			if(array_length(global.svchange[3])<=real(_sv[3])){
				for(var _i=array_length(global.svchange[3]);_i<=real(_sv[3]);_i++;){
					global.svchange[3][_i]=[];
				}
			}
			array_push(global.svchange[3][real(_sv[3])],[real(_sv[1]),real(_sv[2])]);
		}
		else if(_sv[0]=="XN"){
			if(array_length(global.svchange[4])<=real(_sv[3])){
				for(var _i=array_length(global.svchange[4]);_i<=real(_sv[3]);_i++;){
					global.svchange[4][_i]=[];
				}
			}
			array_push(global.svchange[4][real(_sv[3])],[real(_sv[1]),real(_sv[2])]);
		}
		else if(_sv[0]=="FS"){
			if(array_length(global.svchange[1])<=real(_sv[2])){
				for(var _i=array_length(global.svchange[1]);_i<=real(_sv[2]);_i++;){
					global.svchange[1][_i]=[];
				}
			}
			array_push(global.svchange[1][real(_sv[2])],[real(_sv[1]),1]);
			if(array_length(global.svchange[2])<=real(_sv[2])){
				for(var _i=array_length(global.svchange[2]);_i<=real(_sv[2]);_i++;){
					global.svchange[2][_i]=[];
				}
			}
			array_push(global.svchange[2][real(_sv[2])],[real(_sv[1]),0]);
			if(array_length(global.svchange[3])<=real(_sv[2])){
				for(var _i=array_length(global.svchange[3]);_i<=real(_sv[2]);_i++;){
					global.svchange[3][_i]=[];
				}
			}
			array_push(global.svchange[3][real(_sv[2])],[real(_sv[1]),0]);
			if(array_length(global.svchange[4])<=real(_sv[2])){
				for(var _i=array_length(global.svchange[4]);_i<=real(_sv[2]);_i++;){
					global.svchange[4][_i]=[];
				}
			}
			array_push(global.svchange[4][real(_sv[2])],[real(_sv[1]),0]);
			if(array_length(global.svchange[0])<=real(_sv[2])){
				for(var _i=array_length(global.svchange[0]);_i<=real(_sv[2]);_i++;){
					global.svchange[0][_i]=[];
				}
			}
			array_push(global.svchange[0][real(_sv[2])],[real(_sv[1]),1]);
			
		}
		else if(_sv[0]=="SC"){
			if(array_length(global.svchange[0])<=real(_sv[3])){
				for(var _i=array_length(global.svchange[0]);_i<=real(_sv[3]);_i++;){
					global.svchange[0][_i]=[];
				}
			}
			array_push(global.svchange[0][real(_sv[3])],[real(_sv[1]),real(_sv[2])]);
		}
		else {
			array_push(global.svchange[9],_sv);
		}
	}
    file_text_readln(_file);
	i++;
}
file_text_close(_file);
//show_debug_message(global.svchange[9]);

i = 0;
while(i<array_length(global.svchange[0])){
	array_sort(global.svchange[0][i],function(elm1, elm2){
		return real(elm1[0])-real(elm2[0]);
	});
i++;
}
i = 0;
while(i<array_length(global.svchange[5])){
	array_sort(global.svchange[5][i],function(elm1, elm2){
		return real(elm1[0])-real(elm2[0]);
	});
i++;
}
i = 0;
while(i<array_length(global.svchange[8])){
	array_sort(global.svchange[8][i],function(elm1, elm2){
		return real(elm1[0])-real(elm2[0]);
	});
i++;
}
i = 0;
while(i<array_length(global.svchange[7])){
	array_sort(global.svchange[7][i],function(elm1, elm2){
		return real(elm1[0])-real(elm2[0]);
	});
i++;
}
i = 0;
while(i<array_length(global.svchange[7])){
	array_sort(global.svchange[7][i],function(elm1, elm2){
		return real(elm1[0])-real(elm2[0]);
	});
i++;
}
i = 0;
while(i<array_length(global.svchange[1])){
	array_sort(global.svchange[1][i],function(elm1, elm2){
		return real(elm1[0])-real(elm2[0]);
	});
i++;
}
i = 0;
while(i<array_length(global.svchange[4])){
	array_sort(global.svchange[4][i],function(elm1, elm2){
		return real(elm1[0])-real(elm2[0]);
	});
i++;
}
i = 0;
while(i<array_length(global.svchange[3])){
	array_sort(global.svchange[3][i],function(elm1, elm2){
		return real(elm1[0])-real(elm2[0]);
	});
i++;
}
i = 0;
while(i<array_length(global.svchange[3])){
	array_sort(global.svchange[3][i],function(elm1, elm2){
		return real(elm1[0])-real(elm2[0]);
	});
i++;
}
array_sort(global.svchange[9],function(elm1, elm2){
	return real(elm1[1])-real(elm2[1]);
});
scr_cancelchart();
scr_cancelsv();
scr_listchange(1);
//show_debug_message(global.svchange)


