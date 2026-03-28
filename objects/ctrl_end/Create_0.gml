game_set_speed(60, gamespeed_fps);
acc=100*(global.judgelist[0]+global.judgelist[1]*0.75+global.judgelist[2]*0.5)
  /(global.judgelist[0]+global.judgelist[1]+global.judgelist[2]+global.judgelist[3]);
  
if acc>100 result="?"
else if acc==100 result="wow";
else if acc>99 result="S+";
else if acc>95 result="S";
else if acc>90 result="A";
else if acc>85 result="B";
else if acc>80 result="C";
else if acc<=0 result="X";
else result="D";

color=0
if(global.judgelist[3]==0){
	color=200
	if(global.maxel[1]-global.maxel[0]<80*global.judgesize){
		color=600
	}
	else if(global.maxel[1]-global.maxel[0]<160*global.judgesize){
		color=400;
	}
}

oldhighscore=global.highscore[global.level]%200;
var _maxcolor=floor(global.highscore[global.level]/200),_maxacc=global.highscore[global.level]%200;
if(_maxcolor<color) _maxcolor=color;
if(_maxacc<acc) _maxacc=acc;
if global.scored==0 exit;
if(_maxacc+_maxcolor>global.highscore[global.level]){
	global.highscore[global.level]=_maxacc+_maxcolor;
	var _file = file_text_open_write(working_directory + "highscore/"+string(global.filelist[global.chart])+".pqc");
	var i=0;
	while(i<array_length(global.highscore)){
		file_text_write_string(_file,string_format(global.highscore[i],0,4)+"\n");
		i++;
	}
	file_text_close(_file);
	
}