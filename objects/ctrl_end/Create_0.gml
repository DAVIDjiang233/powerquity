global.currenttext=global.resulttext;
global.currentsprite=global.resultsprite;
global.drawdepth=[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
for(var _i=0;_i<array_length(global.currenttext);_i++){
	if(global.currenttext[_i]!=0){
		instance_create_depth(
			0,0,global.currenttext[_i][1],bplaytext,
			{
				halign : global.currenttext[_i][0],
				mx : global.currenttext[_i][2],
				my : global.currenttext[_i][3],
				textshow : global.currenttext[_i][4],
				msx : global.currenttext[_i][5],
				msy : global.currenttext[_i][6],
				angle : global.currenttext[_i][7],
				alpha : global.currenttext[_i][8],
				font : global.currenttext[_i][9],
				color : global.currenttext[_i][10],
				maxsize : global.currenttext[_i][11],
				mirror : global.currenttext[_i][12]
			}
		);
	}
}

for(var _i=0;_i<array_length(global.currentsprite);_i++){
	if(global.currentsprite[_i]!=0){
		instance_create_depth(
			0,0,global.currentsprite[_i][0],bplaysprite,
			{
				mx : global.currentsprite[_i][1],
				my : global.currentsprite[_i][2],
				spr : global.playskin[global.currentsprite[_i][3]],
				msx : global.currentsprite[_i][4],
				msy : global.currentsprite[_i][5],
				angle : global.currentsprite[_i][6],
				alpha : global.currentsprite[_i][7],
				color : global.currentsprite[_i][8],
				sprfps : global.currentsprite[_i][9],
				mirror : global.currentsprite[_i][10]
			}
		);
	}
}

global.playtime=0;
endtime=current_time;
cursor_sprite=global.playskin[91];
if(global.playskin[91]==gunmu){
	window_set_cursor(cr_default);
}
else{
	window_set_cursor(cr_none);
}
game_set_speed(60, gamespeed_fps);

acc=global.textlist[20];
  
if acc>100 result="?"
else if acc==100 result="wow";
else if acc>99 result="S+";
else if acc>95 result="S";
else if acc>90 result="A";
else if acc>85 result="B";
else if acc>80 result="C";
else if acc<=0 result="X";
else result="D";



oldhighscore=global.highscore[global.level]%200;
var _maxcolor=global.textlist[38],_maxacc=global.textlist[32];
if(_maxcolor<global.textlist[42]) _maxcolor=global.textlist[42];
if(_maxacc<global.textlist[20]) _maxacc=global.textlist[20];
if global.scored==0 exit;
if(_maxacc+(_maxcolor*200)>global.highscore[global.level]){
	global.highscore[global.level]=_maxacc+(_maxcolor*200);
	var _file = file_text_open_write(working_directory + "highscore/"+string(global.filelist[global.chart])+".pqc");
	var i=0;
	while(i<array_length(global.highscore)){
		file_text_write_string(_file,string_format(global.highscore[i],0,4)+"\n");
		i++;
	}
	file_text_close(_file);
	
}