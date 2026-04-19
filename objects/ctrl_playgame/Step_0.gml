if(keyboard_check_pressed(global.pressext[0])){
	global.chartspeed=[1,1,1,1,1,1];
	global.chartspeedtime=[[[1,-10000]],[[1,-10000]],[[1,-10000]],[[1,-10000]],[[1,-10000]],[[1,-10000]]];
	global.chartmoveinspeed=[0,0,0,0,0,0];
	global.chartmoveinglobal=[0,0,0,0,0,0];
	global.chartxmove=[0,0,0,0,0,0];
	global.rand=[random(0.998),random(0.998),random(0.998),random(0.998)];
	global.pressreal=[ord("0"),ord("1"),ord("2"),ord("3"),ord("4"),ord("5")];
	global.pressdet=[0,0,0,0,0,0];

	global.bloom=[0];
	global.chromatic=[0,1.05];

	global.chartread=[];
	global.svread=[];
	global.presschangeread=[];
	global.playtime=-2000;
	global.keylist=[0,0,0,0,0,0];
	global.keytouchlist=[0,0,0,0,0,0];
	global.judgelist=[0,0,0,0];

	room_restart();
}

if(keyboard_check_pressed(global.pressext[1])){
	if alarm[1]>0 exit;
	if gamepause==0{
		alarm[1]=fps;
		gamepause=1;
		pausestart=current_time;
		audio_pause_all();
	}
	else if (gamepause==1){
		gamepause=2;
		alarmpause=current_time+1000;
		alarm[1]=0;
	}
}

if(alarmpause<current_time&&alarmpause>-10000){
	alarmpause=-999999
	audio_resume_all();
	gamepause=0;
	pausetime=pausetime+current_time-pausestart;
	base_pause.pressedtype=0;
	
	
	if global.playtype==1 {
		if !keyboard_check(global.press[0]) {keyboard_key_release(ord("1"));global.pressdet[1]=0;}
		if !keyboard_check(global.press[1]) {keyboard_key_release(ord("2"));global.pressdet[2]=0;}
		if !keyboard_check(global.press[2]) {keyboard_key_release(ord("3"));global.pressdet[3]=0;}
		if !keyboard_check(global.press[3]) {keyboard_key_release(ord("4"));global.pressdet[4]=0;}
	
	}
	else{
		if !keyboard_check(global.press[5])&&keyboard_check(ord("2")) {
			keyboard_key_release(ord("2"));global.pressdet[2]=0;
			keyboard_key_press(ord("1"));global.pressdet[1]=1;
		}
		if !keyboard_check(global.press[6]) {keyboard_key_release(ord("3"));global.pressdet[3]=0;}
		if !keyboard_check(global.press[7]) {keyboard_key_release(ord("4"));global.pressdet[4]=0;}
	}
	
}



if gamepause!=0 exit; 

global.keytouchlist[0]=ceil(global.keytouchlist[0]);
global.keytouchlist[1]=ceil(global.keytouchlist[1]);
global.keytouchlist[2]=ceil(global.keytouchlist[2]);
global.keytouchlist[3]=ceil(global.keytouchlist[3]);
global.keytouchlist[4]=ceil(global.keytouchlist[4]);
global.keytouchlist[5]=ceil(global.keytouchlist[5]);

if global.playtype==1 scr_normal_ctrl();
else scr_qwertyuiop_ctrl();



if(global.playtime>=delay+timingdelay&&!audio_is_playing(musicplay)&&global.playtime<=delay+timingdelay+500)
audio_play_sound_ext({
	sound: musicplay,
	pitch: global.gamespeed

});


//sv
var chartlist=0;
while(chartlist<512&&0<array_length(global.svread)){
	if real(global.svread[0][1])<=global.playtime{
		//S SN M MN MG MGN X XN E T /R/
		if(global.svread[0][0]=="R"){
			global.rand[real(global.svread[0][2])]=random(1);
			array_delete(global.svread,0,1);
		}
		if(global.svread[0][0]=="RT"){
			var _show=global.svread[0][28+floor(global.rand[real(global.svread[0][27])]*(array_length(global.svread[0])-28))];
			if _show=="0" array_delete(global.svread,0,1);
			else global.svread[0][0]="T";
		}
		if(global.svread[0][0]=="FS"){

			global.chartspeed[real(global.svread[0][2])]=1;
			global.chartmoveinspeed[real(global.svread[0][2])]=0;
			global.chartmoveinglobal[real(global.svread[0][2])]=0;
			global.chartxmove[real(global.svread[0][2])]=0;
			array_delete(global.svread,0,1);
		}
		else if(global.svread[0][0]=="S"){
			if global.svenable==1{
				instance_create_depth(0,0,0,bsv_speedchange,
				{
					stime: real(global.svread[0][1]),
					oriamont : real(global.svread[0][2]),
					timinggroup : real(global.svread[0][4]),
					movetype : scr_nibl2array(global.svread[0][5]),
					etime: real(global.svread[0][1])+real(global.svread[0][3])
				});
			}
			array_delete(global.svread,0,1);
		}
		else if(global.svread[0][0]=="SN"){
			if global.svenable==1
			global.chartspeed[real(global.svread[0][3])]=real(global.svread[0][2]);
			else global.chartspeed[real(global.svread[0][3])]=1;
			array_delete(global.svread,0,1);
		}
		else if(global.svread[0][0]=="M"){
			if global.svenable==1{
			instance_create_depth(0,0,0,bsv_movespeedchange,
				{
					stime: real(global.svread[0][1]),
					oriamont : real(global.svread[0][2]),
					timinggroup : real(global.svread[0][4]),
					movetype : scr_nibl2array(global.svread[0][5]),
					etime: real(global.svread[0][1])+real(global.svread[0][3])
				});
			}
			array_delete(global.svread,0,1);
		}
		else if(global.svread[0][0]=="MN"){
			if global.svenable==1
			global.chartmoveinspeed[real(global.svread[0][3])]=real(global.svread[0][2]);
			else global.chartmoveinspeed[real(global.svread[0][3])]=0;
			array_delete(global.svread,0,1);
		}
		else if(global.svread[0][0]=="MG"){
			if global.svenable==1{
			instance_create_depth(0,0,0,bsv_moveglobalchange,
				{
					stime: real(global.svread[0][1]),
					oriamont : real(global.svread[0][2]),
					timinggroup : real(global.svread[0][4]),
					movetype : scr_nibl2array(global.svread[0][5]),
					etime: real(global.svread[0][1])+real(global.svread[0][3])
				});
			}
			array_delete(global.svread,0,1);
		}
		else if(global.svread[0][0]=="MGN"){
			if global.svenable==1
			global.chartmoveinglobal[real(global.svread[0][3])]=real(global.svread[0][2]);
			else global.chartmoveinglobal[real(global.svread[0][3])]=0;
			array_delete(global.svread,0,1);
		}
		else if(global.svread[0][0]=="X"){
			if global.svenable==1{
				instance_create_depth(0,0,0,bsv_movex,
				{
					
					stime: real(global.svread[0][1]),
					oriamont : real(global.svread[0][2]),
					timinggroup : real(global.svread[0][4]),
					movetype : scr_nibl2array(global.svread[0][5]),
					etime: real(global.svread[0][1])+real(global.svread[0][3])
				});
			}
			array_delete(global.svread,0,1);
		}
		else if(global.svread[0][0]=="XN"){
			if global.svenable==1
			global.chartxmove[real(global.svread[0][3])]=real(global.svread[0][2]);
			else global.chartxmove[real(global.svread[0][3])]=0;
			array_delete(global.svread,0,1);
		}
		else if(global.svread[0][0]=="CA"){
			if global.svenable==1{
				if !instance_exists(shad_ca) instance_create_depth(114,514,-9999,shad_ca);
				var _alltime=floor(real(global.svread[0][3])*fps/(global.gamespeed*1000));
				instance_create_depth(0,0,0,bsv_moveca,
				{
					stime: real(global.svread[0][1]),
					oriamont : real(global.svread[0][2]),
					timinggroup : real(global.svread[0][4]),
					movetype : scr_nibl2array(global.svread[0][5]),
					etime: real(global.svread[0][1])+real(global.svread[0][3])
				});}
			array_delete(global.svread,0,1);
		}
		else if(global.svread[0][0]=="CAN"){
			if global.svenable==1{
				if !instance_exists(shad_ca) instance_create_depth(114,514,-9999,shad_ca);
				global.chromatic[real(global.svread[0][3])]=real(global.svread[0][2]);
			}
			else global.chromatic[real(global.svread[0][3])]=0;
			array_delete(global.svread,0,1);
		}
		else if(global.svread[0][0]=="CB"){
			if global.svenable==1{
				if !instance_exists(shad_bloom) instance_create_depth(114,514,-9999,shad_bloom);
				var _alltime=floor(real(global.svread[0][3])*fps/(global.gamespeed*1000));
				instance_create_depth(0,0,0,bsv_movebloom,
				{
					stime: real(global.svread[0][1]),
					oriamont : real(global.svread[0][2]),
					timinggroup : real(global.svread[0][4]),
					movetype : scr_nibl2array(global.svread[0][5]),
					etime: real(global.svread[0][1])+real(global.svread[0][3])
				});}
			array_delete(global.svread,0,1);
		}
		else if(global.svread[0][0]=="CBN"){
			if global.svenable==1{
				if !instance_exists(shad_bloom) instance_create_depth(114,514,-9999,shad_bloom);
				global.bloom[real(global.svread[0][3])]=real(global.svread[0][2]);
			}
			else global.bloom[real(global.svread[0][3])]=0;
			array_delete(global.svread,0,1);
		}
		else if(global.svread[0][0]=="T"){
			if global.svenable==1{
			instance_create_depth(0,0,real(global.svread[0][26]),bsv_textspawn,
				{
					stime: real(global.svread[0][1]),
					etime: real(global.svread[0][1])+real(global.svread[0][3]),
					textshow : string(global.svread[0][2]),
					mx1 : real(global.svread[0][4]),
					my1 : real(global.svread[0][5]),
					mgy1 : real(global.svread[0][6]),
					msx1 : real(global.svread[0][7]),
					msy1 : real(global.svread[0][8]),
					ma1 : real(global.svread[0][9]),
					mr1 : real(global.svread[0][10]),
					mx2 : real(global.svread[0][11]),
					my2 : real(global.svread[0][12]),
					mgy2 : real(global.svread[0][13]),
					msx2 : real(global.svread[0][14]),
					msy2 : real(global.svread[0][15]),
					ma2 : real(global.svread[0][16]),
					mr2 : real(global.svread[0][17]),
					ex : scr_nibl2array(global.svread[0][18]),
					ey : scr_nibl2array(global.svread[0][19]),
					egy : scr_nibl2array(global.svread[0][20]),
					esx : scr_nibl2array(global.svread[0][21]),
					esy : scr_nibl2array(global.svread[0][22]),
					ea : scr_nibl2array(global.svread[0][23]),
					er : scr_nibl2array(global.svread[0][24]),
					txtcolor : real(global.svread[0][25]),
				});}
			array_delete(global.svread,0,1);
		}
		else if(global.svread[0][0]=="P"){
			if global.svenable==1{
				if(real(global.svread[0][2])<=-1){
					global.svread[0][2]=global.lastskinum-real(global.svread[0][2]);
				}
			instance_create_depth(0,0,real(global.svread[0][23]),bsv_spritespawn,
				{
					stime: real(global.svread[0][1]),
					etime: real(global.svread[0][1])+real(global.svread[0][3]),
					spr : global.playskin[real(global.svread[0][2])],
					mx1 : real(global.svread[0][4]),
					my1 : real(global.svread[0][5]),
					msx1 : real(global.svread[0][6]),
					msy1 : real(global.svread[0][7]),
					ma1 : real(global.svread[0][8]),
					mr1 : real(global.svread[0][9]),
					mx2 : real(global.svread[0][10]),
					my2 : real(global.svread[0][11]),
					msx2 : real(global.svread[0][12]),
					msy2 : real(global.svread[0][13]),
					ma2 : real(global.svread[0][14]),
					mr2 : real(global.svread[0][15]),
					ex : scr_nibl2array(global.svread[0][16]),
					ey : scr_nibl2array(global.svread[0][17]),
					esx : scr_nibl2array(global.svread[0][18]),
					esy : scr_nibl2array(global.svread[0][19]),
					ea : scr_nibl2array(global.svread[0][20]),
					er : scr_nibl2array(global.svread[0][21]),
					sprcolor : real(global.svread[0][22]),
					sprfps : real(global.svread[0][24])
				});}
			array_delete(global.svread,0,1);
		}
		else if(global.svread[0][0]=="Told"){
			if global.svenable==1{
			instance_create_depth(0,0,0,bsv_textspawnold,
				{
					alltime : floor(real(global.svread[0][3])*fps/(global.gamespeed*1000)),
					textshow : string(global.svread[0][2]),
					mx1 : real(global.svread[0][4]),
					my1 : real(global.svread[0][5]),
					ms1 : real(global.svread[0][6]),
					ma1 : real(global.svread[0][7]),
					mx2 : real(global.svread[0][8]),
					my2 : real(global.svread[0][9]),
					ms2 : real(global.svread[0][10]),
					ma2 : real(global.svread[0][11]),
					txtcolor : real(global.svread[0][12]),
					ease : real(global.svread[0][13]),
				});}
			array_delete(global.svread,0,1);
		}
		else if(global.svread[0][0]=="E"){
			room_goto(room_gameover);
		}
		else array_delete(global.svread,0,1);
		chartlist++;
	}
	else chartlist=512;
}

//note
chartlist=0;
while(chartlist<64&&0<array_length(global.chartread)){
	if real(global.chartread[0][1])-4000<=global.playtime{
		//T B F BP N M A L R P
		//random
		var _prot=0;
		if(global.chartread[0][0]=="R"){
			_prot=1;
			global.rand[real(global.chartread[0][2])]=random(1);
			array_delete(global.chartread,0,1);
		}
		if array_length(global.chartread)!=0{
		if(global.chartread[0][0]=="RT"){
			_prot=1;
			var _track=global.chartread[0][4+floor(global.rand[real(global.chartread[0][2])]*(array_length(global.chartread[0])-4))];
			if _track=="none" array_delete(global.chartread,0,1);
			else{
				global.chartread[0][0]="T";
				global.chartread[0][2]=_track;
				global.chartread[0][4]=1;
			}
		}
		else if(global.chartread[0][0]=="RF"){
			_prot=1;
			var _track=global.chartread[0][5+floor(global.rand[real(global.chartread[0][2])]*(array_length(global.chartread[0])-5))];
			if _track=="none" array_delete(global.chartread,0,1);
			else{
				global.chartread[0][0]="F";
				global.chartread[0][2]=_track;
			}
		}
		else if(global.chartread[0][0]=="RM"){
			_prot=1;
			var _track=global.chartread[0][4+floor(global.rand[real(global.chartread[0][2])]*(array_length(global.chartread[0])-4))];
			if _track=="none" array_delete(global.chartread,0,1);
			else{
				global.chartread[0][0]="M";
				global.chartread[0][2]=_track;
			}
		}
		else if(global.chartread[0][0]=="RA"){
			_prot=1;
			var _track=global.chartread[0][4+floor(global.rand[real(global.chartread[0][2])]*(array_length(global.chartread[0])-4))];
			if _track=="none" array_delete(global.chartread,0,1);
			else{
				global.chartread[0][0]="A";
				global.chartread[0][2]=_track;
			}
		}
		}
		
		if array_length(global.chartread)!=0{
		//tap
		if(global.chartread[0][0]=="T"){
			if(global.autoplay==2&&real(global.chartread[0][2])>=1&&real(global.chartread[0][2])<=4){
				var _i=real(global.chartread[0][2])-1;
				var _timing=scr_rand(global.taptiming[_i][0], global.taptiming[_i][1]);
				
				if(array_length(autopress[_i])>0){
					autopress[_i][array_length(autopress[_i])-1][1]-=
					max(0,100+autopress[_i][array_length(autopress[_i])-1][1]-(real(global.chartread[0][1])+_timing))
					*random_range(0,1)*global.effecttiming[_i]/100;
					_timing+=max(0,100+autopress[_i][array_length(autopress[_i])-1][1]-(real(global.chartread[0][1])+_timing))
					*random_range(0,1)*global.effecttiming[_i]/100;
				}
				
				array_push(autopress[_i],
				["T",real(global.chartread[0][1])+_timing]);
			}
			if(array_length(global.chartread[0])<5){
				global.chartread[0][4]=1;
			}
			instance_create_depth(0,-1145,-2000,ekey,
			{
				endtime : real(global.chartread[0][1]),
				key1 : real(global.chartread[0][2]),
				timinggroup : real(global.chartread[0][3]),
				keyamo : global.keylist[real(global.chartread[0][2])],
				exjudge : real(global.chartread[0][4])
			});
			global.keylist[global.chartread[0][2]]++;
			array_delete(global.chartread,0,1);
		}
		//bumper
		else if(global.chartread[0][0]=="BP"){
			if(global.autoplay==2){
				var _i=real(global.chartread[0][2])-1;
				var _timing=scr_rand(global.taptiming[_i][0], global.taptiming[_i][1]);
				if(_i==-1){
					array_push(autopress[0],
					["T",real(global.chartread[0][1])+_timing]);
				}
				else if(_i==3){
					array_push(autopress[3],
					["T",real(global.chartread[0][1])+_timing]);
				}
				else{
					array_push(autopress[_i],
					["BP",real(global.chartread[0][1])+_timing]);
				}
			}
			if(array_length(global.chartread[0])<5){
				global.chartread[0][4]=0;
			}
			instance_create_depth(0,-1145,-2000,ekey_bumper,
			{
				endtime : real(global.chartread[0][1]),
				key1 : real(global.chartread[0][2]),
				timinggroup : real(global.chartread[0][3]),
				keyamo : global.keylist[real(global.chartread[0][2])],
				keyamo2 : global.keylist[real(global.chartread[0][2])+1],
				exjudge : real(global.chartread[0][4])
			});
			global.keylist[global.chartread[0][2]]++;
			global.keylist[real(global.chartread[0][2])+1]++;
			array_delete(global.chartread,0,1);
		}
		//triper
		else if(global.chartread[0][0]=="TP"){
			if(global.autoplay==2){
				var _i=real(global.chartread[0][2])-1;
				var _timing=scr_rand(global.taptiming[_i][0], global.taptiming[_i][1]);
				if(_i==-1){
					array_push(autopress[0],
					["BP",real(global.chartread[0][1])+_timing]);
				}
				else if(_i==2){
					array_push(autopress[2],
					["BP",real(global.chartread[0][1])+_timing]);
				}
				else{
					array_push(autopress[_i],
					["TP",real(global.chartread[0][1])+_timing]);
				}
			}
			if(array_length(global.chartread[0])<5){
				global.chartread[0][4]=0;
			}
			instance_create_depth(0,-1145,-2000,ekey_triper,
			{
				endtime : real(global.chartread[0][1]),
				key1 : real(global.chartread[0][2]),
				timinggroup : real(global.chartread[0][3]),
				keyamo : global.keylist[real(global.chartread[0][2])],
				keyamo2 : global.keylist[real(global.chartread[0][2])+1],
				keyamo3 : global.keylist[real(global.chartread[0][2])+2],
				exjudge : real(global.chartread[0][4])
			});
			global.keylist[global.chartread[0][2]]++;
			global.keylist[real(global.chartread[0][2])+1]++;
			global.keylist[real(global.chartread[0][2])+2]++;
			array_delete(global.chartread,0,1);
		}
		//quader
		else if(global.chartread[0][0]=="QP"){
			if(global.autoplay==2){
				var _i=real(global.chartread[0][2])-1;
				var _timing=scr_rand(global.taptiming[_i][0], global.taptiming[_i][1]);
				if(_i==-1){
					array_push(autopress[0],
					["TP",real(global.chartread[0][1])+_timing]);
				}
				else if(_i==1){
					array_push(autopress[1],
					["TP",real(global.chartread[0][1])+_timing]);
				}
				else{
					array_push(autopress[_i],
					["QP",real(global.chartread[0][1])+_timing]);
				}
			}
			if(array_length(global.chartread[0])<5){
				global.chartread[0][4]=0;
			}
			instance_create_depth(0,-1145,-2000,ekey_quader,
			{
				endtime : real(global.chartread[0][1]),
				key1 : real(global.chartread[0][2]),
				timinggroup : real(global.chartread[0][3]),
				keyamo : global.keylist[real(global.chartread[0][2])],
				keyamo2 : global.keylist[real(global.chartread[0][2])+1],
				keyamo3 : global.keylist[real(global.chartread[0][2])+2],
				keyamo4 : global.keylist[real(global.chartread[0][2])+3],
				exjudge : real(global.chartread[0][4])
			});
			global.keylist[global.chartread[0][2]]++;
			global.keylist[real(global.chartread[0][2])+1]++;
			global.keylist[real(global.chartread[0][2])+2]++;
			global.keylist[real(global.chartread[0][2])+3]++;
			array_delete(global.chartread,0,1);
		}
		//fake
		else if(global.chartread[0][0]=="F"){
			if global.svenable==1{
				instance_create_depth(0,-1145,-2000,ekey_fake,
				{
					endtime : real(global.chartread[0][1]),
					key1 : real(global.chartread[0][2]),
					timinggroup : real(global.chartread[0][3]),
					notecolor : real(global.chartread[0][4])
				});
			}
			array_delete(global.chartread,0,1);
		}
		//barline
		else if(global.chartread[0][0]=="B"){
			if global.svenable==1{
				instance_create_depth(0,-1145,-1000,ekey_barline,
				{
					endtime : real(global.chartread[0][1]),
					key1 : real(global.chartread[0][2]),
					timinggroup : real(global.chartread[0][3])
				});
			}
			array_delete(global.chartread,0,1);
		}
		//end
		else if(global.chartread[0][0]=="N"){
			if(global.autoplay==2&&real(global.chartread[0][2])>=1&&real(global.chartread[0][2])<=4){
				var _i=real(global.chartread[0][2])-1;
				var _timing=scr_rand(global.holdreleasetiming[_i][0], global.holdreleasetiming[_i][1]);
				array_push(autorelease[_i],
				real(global.chartread[0][1])+_timing);
				array_sort(autorelease[_i],true);
				array_push(autopress[_i],
				["N",real(global.chartread[0][1])+_timing-250,real(global.chartread[0][1])+_timing]);
			}
			instance_create_depth(0,-1145,-2000,ekey_endtap,
			{
				endtime : real(global.chartread[0][1]),
				key1 : real(global.chartread[0][2]),
				timinggroup : real(global.chartread[0][3]),
				keyamo : global.keylist[real(global.chartread[0][2])]
			});
			global.keylist[global.chartread[0][2]]++;
			array_delete(global.chartread,0,1);
		}
		//miss
		else if(global.chartread[0][0]=="M"){
			if(global.autoplay==2&&real(global.chartread[0][2])>=1&&real(global.chartread[0][2])<=4){
				var _i=real(global.chartread[0][2])-1;
				array_push(autopress[_i],
				["M",real(global.chartread[0][1])]);
			}
			instance_create_depth(0,-1145,-2000,ekey_miss,
			{
				endtime : real(global.chartread[0][1]),
				key1 : real(global.chartread[0][2]),
				timinggroup : real(global.chartread[0][3])
			});
			array_delete(global.chartread,0,1);
		}
		//ap
		else if(global.chartread[0][0]=="A"){
			if(global.autoplay==2&&real(global.chartread[0][2])>=1&&real(global.chartread[0][2])<=4){
				var _i=real(global.chartread[0][2])-1;
				var _timing=scr_rand(global.taptiming[_i][0], global.taptiming[_i][1]);
				array_push(autopress2[_i],["A",real(global.chartread[0][1])+_timing]);
			}
			instance_create_depth(0,-1145,-2000,ekey_touchap,
			{
				endtime : real(global.chartread[0][1]),
				key1 : real(global.chartread[0][2]),
				timinggroup : real(global.chartread[0][3])
			});
			array_delete(global.chartread,0,1);
		}
		//fakeln
		else if(global.chartread[0][0]=="L"){
			if global.svenable==1{
				instance_create_depth(0,-1145,0,ekey_fakeln,
			{
				startime : real(global.chartread[0][1]),
				key1 : real(global.chartread[0][2]),
				timinggroup : real(global.chartread[0][3]),
				endtime : real(global.chartread[0][4])
			});
			}
			array_delete(global.chartread,0,1);
		}
		//ln
		else if(global.chartread[0][0]=="LN"){
			if(global.autoplay==2){
				var _i=real(global.chartread[0][2])-1;
				var _timing=scr_rand(global.taptiming[_i][0], global.taptiming[_i][1]);
				if(array_length(autopress[_i])>0){
					autopress[_i][array_length(autopress[_i])-1][1]-=
					max(0,100+autopress[_i][array_length(autopress[_i])-1][1]-(real(global.chartread[0][1])+_timing))
					*random_range(0,1)*global.effecttiming[_i]/100;
					_timing+=max(0,100+autopress[_i][array_length(autopress[_i])-1][1]-(real(global.chartread[0][1])+_timing))
					*random_range(0,1)*global.effecttiming[_i]/100;
				}
				array_push(autopress[_i],
				["LN",real(global.chartread[0][1])+_timing,real(global.chartread[0][4])]);
			}
			if(array_length(global.chartread[0])<6){
				global.chartread[0][5]=1;
			}
			instance_create_depth(0,-1145,0,ekey_ln,
			{
				startime : real(global.chartread[0][1]),
				key1 : real(global.chartread[0][2]),
				timinggroup : real(global.chartread[0][3]),
				endtime : real(global.chartread[0][4]),
				keyamo : global.keylist[real(global.chartread[0][2])],
				exjudge : real(global.chartread[0][5])
			});
				global.keylist[global.chartread[0][2]]++;
				array_delete(global.chartread,0,1);
			}
		//presschange
		else if(global.chartread[0][0]=="P"){
				instance_create_depth(0,-1145,5000,ekey_presschange,
			{
				endtime : real(global.chartread[0][1]),
				key1 : real(global.chartread[0][2]),
				timinggroup : real(global.chartread[0][3]),
				changebar : real(global.chartread[0][4])
			});
			array_delete(global.chartread,0,1);
		}
		else if _prot==0 array_delete(global.chartread,0,1);
		}
		chartlist++;
	}
	else chartlist=64;
}

chartlist=0;
while(chartlist<array_length(global.chartspeedtime)){
	if array_length(global.chartspeedtime[chartlist])>1{
		while global.chartspeedtime[chartlist][1][1]<global.playtime{
			array_delete(global.chartspeedtime[chartlist],0,1);
			if array_length(global.chartspeedtime[chartlist])<=1 break;
		}
	}
	chartlist++;
}
//show_debug_message(autopress);
for(var _i=0;_i<4;_i++){
	if (array_length(autorelease[_i])>0&&autorelease[_i][0]<=global.playtime){
		keyboard_key_release(global.pressreal[_i+1]);
		array_delete(autorelease[_i],0,1);
		autocooldown[_i]=global.playtime+scr_rand(global.cooldowntiming[_i][0], global.cooldowntiming[_i][1]);
	}
}
for(var _i=0;_i<4;_i++){
	if (array_length(autopress[_i])>0&&autopress[_i][0][1]<=global.playtime){
		
		var _release=scr_rand(global.releasetiming[_i][0], global.releasetiming[_i][1]);
		var _m=_i
		if(autopress[_i][0][0]=="T"){
			
			if(array_length(autopress[_i])>1&&autopress[_i][1][0]=="N"){
				keyboard_key_press(global.pressreal[_i+1]);
			}
			else if(keyboard_check(global.pressreal[_i+1])||autocooldown[_i]>global.playtime){
				var _cooldown=autocooldown[_i];
				if(keyboard_check(global.pressreal[_i+1])&&array_length(autorelease[_i])>0) var _cooldown=autorelease[_i][0];
				autopress[_i][0][1]=_cooldown;
				array_sort(autopress[_i],
				function(elm1, elm2)
				{
					var _a=elm1[1],_b=elm2[1];
					if(elm1[0]=="N") _a=elm1[1]+250;
					if(elm2[0]=="N") _b=elm2[1]+250;
					return _a - _b;
				});
				for(var _z=0;(_z<array_length(autopress[_i])&&autopress[_i][_z][1]<_cooldown);_z++){
					if(autopress[_i][_z][0]=="T"||autopress[_i][_z][0]=="LN"){
						array_delete(autopress[_i],_z,1);
						_z--;
					}
				}
				array_insert(autopress[_i],0,["QQQ",0]);
			}
			else if(array_length(autorelease[_i])==0||array_length(autopress[_i])==1||autopress[_i][1][1]<autorelease[_i][0]){
				keyboard_key_press(global.pressreal[_i+1]);
				if(array_length(autopress[_i])>1&&autopress[_i][1][1]<autopress[_i][0][1]+_release)
				_release/=2;
				array_push(autorelease[_i],autopress[_i][0][1]+_release);
				while(array_length(autopress2[_i])>0&&autopress2[_i][0][0]=="A"&&(array_length(autopress[_i])<=1||autopress2[_i][0][1]<autopress[_i][1][1])){
					
					autorelease[_i][array_length(autorelease[_i])-1]
					=autopress2[_i][0][1]+scr_rand(global.holdreleasetiming[_i][0], global.holdreleasetiming[_i][1]);
					
					array_delete(autopress2[_i],0,1);
					
				}
			}
			
		}
		else if(autopress[_i][0][0]=="BP"){
			var _j=1,_k=_i;
			
			if(keyboard_check(global.pressreal[_k+1])||autocooldown[_k]>global.playtime||
			(array_length(autopress[_k])>1&&autopress[_k][1][0]!="N"&&autopress[_k][1][1]-30<global.playtime))
			{_k++;_j=0;}
			
			_release=scr_rand(global.releasetiming[_k][0], global.releasetiming[_k][1]);
			
			keyboard_key_press(global.pressreal[_k+1]);
			if(array_length(autopress[_k])>_j&&autopress[_k][_j][0]=="N"){
			}
			else if(keyboard_check(global.pressreal[_k+1])){
			}
			else if(array_length(autorelease[_k])==0||array_length(autopress[_k])==_j||autopress[_k][_j][1]<autorelease[_k][0]){
				array_push(autorelease[_k],autopress[_i][0][1]+_release);
			}
			_i=_k;
		}
		else if(autopress[_i][0][0]=="TP"){
			var _j=1,_k=_i;
			
			if(keyboard_check(global.pressreal[_k+1])||autocooldown[_k]>global.playtime||
			(array_length(autopress[_k])>1&&autopress[_k][1][0]!="N"&&autopress[_k][1][1]-30<global.playtime))
			{_k++;_j=0;}
			if(keyboard_check(global.pressreal[_k+1])||autocooldown[_k]>global.playtime||
			(array_length(autopress[_k])>1&&autopress[_k][1][0]!="N"&&autopress[_k][1][1]-30<global.playtime))
			{_k++;}
			
			_release=scr_rand(global.releasetiming[_k][0], global.releasetiming[_k][1]);
			
			keyboard_key_press(global.pressreal[_k+1]);
			if(array_length(autopress[_k])>_j&&autopress[_k][_j][0]=="N"){
			}
			else if(keyboard_check(global.pressreal[_k+1])){
			}
			else if(array_length(autorelease[_k])==0||array_length(autopress[_k])==_j||autopress[_k][_j][1]<autorelease[_k][0]){
				array_push(autorelease[_k],autopress[_i][0][1]+_release);
			}
			_i=_k;
		}
		else if(autopress[_i][0][0]=="QP"){
			var _j=1,_k=_i;
			
			if(keyboard_check(global.pressreal[_k+1])||autocooldown[_k]>global.playtime||
			(array_length(autopress[_k])>1&&autopress[_k][1][0]!="N"&&autopress[_k][1][1]-30<global.playtime))
			{_k++;_j=0;}
			if(keyboard_check(global.pressreal[_k+1])||autocooldown[_k]>global.playtime||
			(array_length(autopress[_k])>1&&autopress[_k][1][0]!="N"&&autopress[_k][1][1]-30<global.playtime))
			{_k++;}
			if(keyboard_check(global.pressreal[_k+1])||autocooldown[_k]>global.playtime||
			(array_length(autopress[_k])>1&&autopress[_k][1][0]!="N"&&autopress[_k][1][1]-30<global.playtime))
			{_k++;}
			
			_release=scr_rand(global.releasetiming[_k][0], global.releasetiming[_k][1]);
			
			keyboard_key_press(global.pressreal[_k+1]);
			if(array_length(autopress[_k])>_j&&autopress[_k][_j][0]=="N"){
			}
			else if(keyboard_check(global.pressreal[_k+1])){
			}
			else if(array_length(autorelease[_k])==0||array_length(autopress[_k])==_j||autopress[_k][_j][1]<autorelease[_k][0]){
				array_push(autorelease[_k],autopress[_i][0][1]+_release);
			}
			_i=_k;
		}
		else if(autopress[_i][0][0]=="N"){
			if(array_length(autopress[_i])==1||autopress[_i][1][1]>autopress[_i][0][2]){
				keyboard_key_press(global.pressreal[_i+1]);
				autorelease[_i]=[];
				array_push(autorelease[_i],autopress[_i][0][2]);
				array_push(autopress2[_i],["N",autopress[_i][0][2]]);
				array_sort(autopress2[_i],
				function(elm1, elm2)
				{
					return elm1[1] - elm2[1];
				});
			}
		}
		else if(autopress[_i][0][0]=="LN"){
			if(array_length(autopress[_i])>1&&autopress[_i][1][0]=="N"){
				keyboard_key_press(global.pressreal[_i+1]);
			}
			else if(keyboard_check(global.pressreal[_i+1])||autocooldown[_i]>global.playtime){
				var _cooldown=autocooldown[_i];
				if(keyboard_check(global.pressreal[_i+1])&&array_length(autorelease[_i])>0) var _cooldown=autorelease[_i][0];
				autopress[_i][0][1]=_cooldown;
				array_sort(autopress[_i],
				function(elm1, elm2)
				{
					var _a=elm1[1],_b=elm2[1];
					if(elm1[0]=="N") _a=elm1[1]+250;
					if(elm2[0]=="N") _b=elm2[1]+250;
					return _a - _b;
				});
				for(var _z=0;(_z<array_length(autopress[_i])&&autopress[_i][_z][1]<_cooldown);_z++){
					if(autopress[_i][_z][0]=="T"||autopress[_i][_z][0]=="LN"){
						array_delete(autopress[_i],_z,1);
						_z--;
					}
				}
				array_insert(autopress[_i],0,["QQQ",0]);
			}
			else if(array_length(autorelease[_i])==0||array_length(autopress[_i])==1||autopress[_i][1][1]<autorelease[_i][0]){
				keyboard_key_press(global.pressreal[_i+1]);
				if(array_length(autopress[_i])>1&&autopress[_i][1][1]<autopress[_i][0][2]+_release)
				_release/=2;
				if(array_length(autopress[_i])>1&&autopress[_i][1][1]<autopress[_i][0][2]+_release)
				_release/=2;
				array_push(autorelease[_i],autopress[_i][0][2]+_release);
			}
		}
		array_sort(autorelease[_i],true);
		//show_debug_message(string(autorelease[_m])+" "+string(_m));
		array_delete(autopress[_m],0,1);
	}
}

for(var _i=0;_i<4;_i++){
	if (array_length(autopress2[_i])>0&&autopress2[_i][0][1]<=global.playtime){
		if(autopress2[_i][0][0]=="A"){
			var _release=scr_rand(global.releasetiming[_i][0], global.releasetiming[_i][1]);
			var _p=9999999,_p2=9999999,_r=9999999;
			if(array_length(autopress[_i])>0) _p=autopress[_i][0][1];
			if(array_length(autorelease[_i])>0) _r=autorelease[_i][0];
			if(!keyboard_check(global.pressreal[_i+1])){
				if(_p-global.playtime>150){
					keyboard_key_press(global.pressreal[_i+1]);
					array_push(autorelease[_i],global.playtime+_release);
					array_sort(autorelease[_i],true);
					while(array_length(autopress2[_i])>1&&_p>autopress2[_i][1][1]&&autopress2[_i][1][0]=="A"){
						autorelease[_i][0]=autopress2[_i][1][1]+scr_rand(global.holdreleasetiming[_i][0], global.holdreleasetiming[_i][1]);
						array_delete(autopress2[_i],0,1);
					}
				}
			}
			else if(array_length(autopress2[_i])>1&&_r<autopress2[_i][1][1]){
				while(array_length(autopress2[_i])>1&&_p>autopress2[_i][1][1]&&autopress2[_i][1][0]=="A"){
					autorelease[_i][0]=autopress2[_i][1][1]+scr_rand(global.holdreleasetiming[_i][0], global.holdreleasetiming[_i][1]);
					array_delete(autopress2[_i],0,1);
				}
			}
		}
		array_delete(autopress2[_i],0,1);
	}
}
