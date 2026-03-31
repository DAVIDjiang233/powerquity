

global.barlist=scr_barline(global.bpmlist, global.playtime, global.playtime+5000);
global.mousetime=(global.playtime-(mouse_y-608)*4/global.globalspeed);

if chartplay==1{
	global.playtime=(current_time-starttime)*global.musicspeed;
	scr_listchange(1);
	if (!audio_is_playing(musicplay)&&global.playtime>0){
	audio_play_sound_ext({sound:musicplay,gain: 1,pitch: global.musicspeed,offset:((global.playtime-delay)/1000)});
}
}
else if(lastmin<current_time/300000) {
	while(lastmin<current_time/300000) lastmin++;
	scr_savechart(
		working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_Autosave.pqc",
		working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv_Autosave.pqc",
		working_directory + "songlist/"+string(global.filelist[global.chart])+"/bpmlist_Autosave.pqc"
	);
	//show_debug_message(lastmin);
}

if (keyboard_check(vk_escape)){
	if(keyboard_check_pressed(ord("N"))){
		if (file_exists(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_Old.pqc"))
		{
			file_delete(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_Old.pqc");
		}
		if (file_exists(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv_Old.pqc"))
		{
			file_delete(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv_Old.pqc");
		}
		if (file_exists(working_directory + "songlist/"+string(global.filelist[global.chart])+"/bpmlist_Old.pqc"))
		{
			file_delete(working_directory + "songlist/"+string(global.filelist[global.chart])+"/bpmlist_Old.pqc");
		}
		scr_savechart(
			working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_Backup.pqc",
			working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv_Backup.pqc",
			working_directory + "songlist/"+string(global.filelist[global.chart])+"/bpmlist_Backup.pqc"
		);
		game_restart();
	}
	else if(keyboard_check_pressed(ord("S"))){
		if (file_exists(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_Old.pqc"))
		{
			file_copy(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_Old.pqc", working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_Backup.pqc");
			file_delete(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_Old.pqc");
		}
		else{
			if (file_exists(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+".pqc"))
			{
			    file_copy(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+".pqc", working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_Backup.pqc");
			}
		}
		if (file_exists(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv_Old.pqc"))
		{
			file_copy(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv_Old.pqc", working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv_Backup.pqc");
			file_delete(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv_Old.pqc");
		}
		else{
			if (file_exists(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv.pqc"))
			{
			    file_copy(working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv.pqc", working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv_Backup.pqc");
			}
		}
		if (file_exists(working_directory + "songlist/"+string(global.filelist[global.chart])+"/bpmlist_Old.pqc"))
		{
			file_copy(working_directory + "songlist/"+string(global.filelist[global.chart])+"/bpmlist_Old.pqc", working_directory + "songlist/"+string(global.filelist[global.chart])+"/bpmlist_Backup.pqc");
			file_delete(working_directory + "songlist/"+string(global.filelist[global.chart])+"/bpmlist_Old.pqc");
		}
		else{
			if (file_exists(working_directory + "songlist/"+string(global.filelist[global.chart])+"/bpmlist.pqc"))
			{
			    file_copy(working_directory + "songlist/"+string(global.filelist[global.chart])+"/bpmlist.pqc", working_directory + "songlist/bpmlist_Backup.pqc");
			}
		}
		scr_savechart(
			working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+".pqc",
			working_directory + "songlist/"+string(global.filelist[global.chart])+"/"+string(global.level)+"_sv.pqc",
			working_directory + "songlist/"+string(global.filelist[global.chart])+"/bpmlist.pqc"
		);
		game_restart();
	
	}
}


if (designview==0){
	
	
	if (global.mouseonbtn==0){
	
		if (keyboard_check_pressed(ord("Q"))){
			var _tg=timinggroup;
			if(_tg<0){_tg=0;}
			if (mouse_x>311&&mouse_x<715){
				if (global.barline>0&&(608+(global.playtime-global.bpmlist[0][0])*global.globalspeed*0.25)>mouse_y){
					//
					array_push(global.chartread,[
					string(global.notetype[0]),
					scr_barfind(global.barlist,global.mousetime),
					round((mouse_x-257)/102),_tg]
					);
					if (global.chartread[array_length(global.chartread)-1][0]=="BP"&&global.chartread[array_length(global.chartread)-1][2]>3){
						global.chartread[array_length(global.chartread)-1][2]=3;
					}
					else if (global.chartread[array_length(global.chartread)-1][0]=="TP"){
						if(global.chartread[array_length(global.chartread)-1][2]>2){
							global.chartread[array_length(global.chartread)-1][2]=2;
						}
						else{
							global.chartread[array_length(global.chartread)-1][2]=1;
						}
					}
					else if (global.chartread[array_length(global.chartread)-1][0]=="QP"){
						global.chartread[array_length(global.chartread)-1][2]=1;
					}
					array_sort(global.chartread,function(elm1, elm2){
						if real(elm1[1])>real(elm2[1]) return 1;
						else if real(elm1[1])<real(elm2[1]) return -1;
						else if elm1[0]="L" return 1;
						else return -1;
					});
					scr_cancelchart();
					scr_listchange(1);
					if(array_length(global.svchange[1][_tg])==0){
						global.svchange[1][_tg]=[[-9999,1]];
					}
					if(array_length(global.svchange[2][_tg])==0){
						global.svchange[2][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[3][_tg])==0){
						global.svchange[3][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[4][_tg])==0){
						global.svchange[4][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[0][_tg])==0){
						global.svchange[0][_tg]=[[-9999,1]];
					}
				}
				else if((608+(global.playtime)*global.globalspeed*0.25)>mouse_y&&mouse_y<608){
					array_push(global.chartread,[
					string(global.notetype[0]),
					round(global.mousetime),
					round((mouse_x-257)/102),_tg]
					);
					if (global.chartread[array_length(global.chartread)-1][0]=="BP"&&global.chartread[array_length(global.chartread)-1][2]>3){
						global.chartread[array_length(global.chartread)-1][2]=3;
					}
					else if (global.chartread[array_length(global.chartread)-1][0]=="TP"){
						if(global.chartread[array_length(global.chartread)-1][2]>2){
							global.chartread[array_length(global.chartread)-1][2]=2;
						}
						else{
							global.chartread[array_length(global.chartread)-1][2]=1;
						}
					}
					else if (global.chartread[array_length(global.chartread)-1][0]=="QP"){
						global.chartread[array_length(global.chartread)-1][2]=1;
					}
					array_sort(global.chartread,function(elm1, elm2){
						if real(elm1[1])>real(elm2[1]) return 1;
						else if real(elm1[1])<real(elm2[1]) return -1;
						else if elm1[0]="L" return 1;
						else return -1;
					});
					scr_cancelchart();
					scr_listchange(1);
					if(array_length(global.svchange[1][_tg])==0){
						global.svchange[1][_tg]=[[-9999,1]];
					}
					if(array_length(global.svchange[2][_tg])==0){
						global.svchange[2][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[3][_tg])==0){
						global.svchange[3][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[4][_tg])==0){
						global.svchange[4][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[0][_tg])==0){
						global.svchange[0][_tg]=[[-9999,1]];
					}
				}
				global.choose=[];
			}
			
		}
		
		if (keyboard_check_pressed(ord("E"))){
			var _tg=timinggroup;
			if(_tg<0){_tg=0;}
			if (mouse_x>311&&mouse_x<715){
				if (global.barline>0&&(608+(global.playtime-global.bpmlist[0][0])*global.globalspeed*0.25)>mouse_y){
					//
					array_push(global.chartread,[
					"F",
					scr_barfind(global.barlist,global.mousetime),
					round((mouse_x-257)/102),_tg,
					16777215]
					);
					array_sort(global.chartread,function(elm1, elm2){
						if real(elm1[1])>real(elm2[1]) return 1;
						else if real(elm1[1])<real(elm2[1]) return -1;
						else if elm1[0]="L" return 1;
						else return -1;
					});
					scr_cancelchart();
					scr_listchange(1);
					if(array_length(global.svchange[1][_tg])==0){
						global.svchange[1][_tg]=[[-9999,1]];
					}
					if(array_length(global.svchange[2][_tg])==0){
						global.svchange[2][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[3][_tg])==0){
						global.svchange[3][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[4][_tg])==0){
						global.svchange[4][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[0][_tg])==0){
						global.svchange[0][_tg]=[[-9999,1]];
					}
				}
				else if((608+(global.playtime)*global.globalspeed*0.25)>mouse_y&&mouse_y<608){
					array_push(global.chartread,[
					"F",
					round(global.mousetime),
					round((mouse_x-257)/102),_tg,
					16777215]
					);
					array_sort(global.chartread,function(elm1, elm2){
						if real(elm1[1])>real(elm2[1]) return 1;
						else if real(elm1[1])<real(elm2[1]) return -1;
						else if elm1[0]="L" return 1;
						else return -1;
					});
					scr_cancelchart();
					scr_listchange(1);
					if(array_length(global.svchange[1][_tg])==0){
						global.svchange[1][_tg]=[[-9999,1]];
					}
					if(array_length(global.svchange[2][_tg])==0){
						global.svchange[2][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[3][_tg])==0){
						global.svchange[3][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[4][_tg])==0){
						global.svchange[4][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[0][_tg])==0){
						global.svchange[0][_tg]=[[-9999,1]];
					}
				}
				global.choose=[];
			}
		}
		
		
		if (keyboard_check_pressed(ord("R"))){
			var _tg=timinggroup;
			if(_tg<0){_tg=0;}
			if (mouse_x>311&&mouse_x<715){
				if (global.barline>0&&(608+(global.playtime-global.bpmlist[0][0])*global.globalspeed*0.25)>mouse_y){
					//
					array_push(global.chartread,[
					"P",
					scr_barfind(global.barlist,global.mousetime),
					round((mouse_x-257)/102),_tg,
					round((mouse_x-257)/102)]
					);
					array_sort(global.chartread,function(elm1, elm2){
						if real(elm1[1])>real(elm2[1]) return 1;
						else if real(elm1[1])<real(elm2[1]) return -1;
						else if elm1[0]="L" return 1;
						else return -1;
					});
					scr_cancelchart();
					scr_listchange(1);
					if(array_length(global.svchange[1][_tg])==0){
						global.svchange[1][_tg]=[[-9999,1]];
					}
					if(array_length(global.svchange[2][_tg])==0){
						global.svchange[2][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[3][_tg])==0){
						global.svchange[3][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[4][_tg])==0){
						global.svchange[4][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[0][_tg])==0){
						global.svchange[0][_tg]=[[-9999,1]];
					}
				}
				else if((608+(global.playtime)*global.globalspeed*0.25)>mouse_y&&mouse_y<608){
					array_push(global.chartread,[
					"P",
					round(global.mousetime),
					round((mouse_x-257)/102),_tg,
					round((mouse_x-257)/102)]
					);
					array_sort(global.chartread,function(elm1, elm2){
						if real(elm1[1])>real(elm2[1]) return 1;
						else if real(elm1[1])<real(elm2[1]) return -1;
						else if elm1[0]="L" return 1;
						else return -1;
					});
					scr_cancelchart();
					scr_listchange(1);
					if(array_length(global.svchange[1][_tg])==0){
						global.svchange[1][_tg]=[[-9999,1]];
					}
					if(array_length(global.svchange[2][_tg])==0){
						global.svchange[2][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[3][_tg])==0){
						global.svchange[3][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[4][_tg])==0){
						global.svchange[4][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[0][_tg])==0){
						global.svchange[0][_tg]=[[-9999,1]];
					}
				}
				global.choose=[];
			}
		}
		
		
	
		if (keyboard_check_pressed(ord("W"))){
			if (mouse_x>311&&mouse_x<715){
				if (global.barline>0&&(608+(global.playtime-global.bpmlist[0][0])*global.globalspeed*0.25)>mouse_y){
					holdinput=scr_barfind(global.barlist,global.mousetime);
					holdtrack=round((mouse_x-257)/102);
				}
				else if((608+(global.playtime)*global.globalspeed*0.25)>mouse_y&&mouse_y<608){
					holdinput=global.mousetime;
					holdtrack=round((mouse_x-257)/102);
				}
			}
		}
	
		if (keyboard_check_released(ord("W"))&&holdinput>=0){
			var yup;
			if (global.barline>0&&holdinput<scr_barfind(global.barlist,global.mousetime)){
				yup=scr_barfind(global.barlist,global.mousetime);
			}
			else if(global.barline==0&&holdinput<global.mousetime){
				yup=round(global.mousetime);
			}
			else yup=-1;
		
			if yup>0{
				var _tg=timinggroup;
				if(_tg<0){_tg=0;}
				array_push(global.chartread,[string(global.notetype[1]),holdinput,holdtrack,_tg,yup]);
				array_sort(global.chartread,function(elm1, elm2){
					if real(elm1[1])>real(elm2[1]) return 1;
					else if real(elm1[1])<real(elm2[1]) return -1;
					else if elm1[0]="L" return 1;
					else return -1;
				});
					scr_cancelchart();
				scr_listchange(1);
					if(array_length(global.svchange[1][_tg])==0){
						global.svchange[1][_tg]=[[-9999,1]];
					}
					if(array_length(global.svchange[2][_tg])==0){
						global.svchange[2][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[3][_tg])==0){
						global.svchange[3][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[4][_tg])==0){
						global.svchange[4][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[0][_tg])==0){
						global.svchange[0][_tg]=[[-9999,1]];
					}
				global.choose=[];
			}
			holdinput=-1;
		}
	}
	
	
}

else if (designview==1){
	
	
	if (global.mouseonbtn==0){
	
		if (keyboard_check_pressed(ord("Q"))){
			if(timinggroup<0){
				
			}
			else{
				if (mouse_x>209&&mouse_x<308){
					if (global.barline>0&&(608+(global.playtime-global.bpmlist[0][0])*global.globalspeed*0.25)>mouse_y){
						//
						array_push(global.svchange[0][timinggroup],[
						scr_barfind(global.barlist,global.mousetime),
						scr_svset(global.svchange[0][timinggroup],[],scr_barfind(global.barlist,global.mousetime))
						]);
						array_sort(global.svchange[0][timinggroup],function(elm1, elm2){
							return real(elm1[0])-real(elm2[0]);
						});
					}
					else if(global.barline==0&&mouse_y<608){
						array_push(global.svchange[0][timinggroup],[
						global.mousetime,
						scr_svset(global.svchange[0][timinggroup],[],global.mousetime)]
						);
						array_sort(global.svchange[0][timinggroup],function(elm1, elm2){
							return real(elm1[0])-real(elm2[0]);
						});
					}
					scr_cancelsv();
					global.svchoose=[[],[],[],[],[],[],[],[],[],[]];
				}
				else if (mouse_x>311&&mouse_x<410){
					if (global.barline>0&&(608+(global.playtime-global.bpmlist[0][0])*global.globalspeed*0.25)>mouse_y){
						//
						array_push(global.svchange[1][timinggroup],[
						scr_barfind(global.barlist,global.mousetime),
						scr_svset(global.svchange[1][timinggroup],global.svchange[5][timinggroup],scr_barfind(global.barlist,global.mousetime))
						]);
						array_sort(global.svchange[1][timinggroup],function(elm1, elm2){
							return real(elm1[0])-real(elm2[0]);
						});
					}
					else if(global.barline==0&&mouse_y<608){
						array_push(global.svchange[1][timinggroup],[
						global.mousetime,
						scr_svset(global.svchange[1][timinggroup],global.svchange[5][timinggroup],global.mousetime)]
						);
						array_sort(global.svchange[1][timinggroup],function(elm1, elm2){
							return real(elm1[0])-real(elm2[0]);
						});
					}
					scr_cancelsv();
					global.svchoose=[[],[],[],[],[],[],[],[],[],[]];
				}
				else if (mouse_x>413&&mouse_x<512){
					if (global.barline>0&&(608+(global.playtime-global.bpmlist[0][0])*global.globalspeed*0.25)>mouse_y){
						//
						array_push(global.svchange[2][timinggroup],[
						scr_barfind(global.barlist,global.mousetime),
						scr_svset(global.svchange[2][timinggroup],global.svchange[6][timinggroup],scr_barfind(global.barlist,global.mousetime))
						]);
						array_sort(global.svchange[2][timinggroup],function(elm1, elm2){
							return real(elm1[0])-real(elm2[0]);
						});
					}
					else if(global.barline==0&&mouse_y<608){
						array_push(global.svchange[2][timinggroup],[
						global.mousetime,
						scr_svset(global.svchange[2][timinggroup],global.svchange[6][timinggroup],global.mousetime)]
						);
						array_sort(global.svchange[2][timinggroup],function(elm1, elm2){
							return real(elm1[0])-real(elm2[0]);
						});
					}
					scr_cancelsv();
					global.svchoose=[[],[],[],[],[],[],[],[],[],[]];
				}
				else if (mouse_x>515&&mouse_x<614){
					if (global.barline>0&&(608+(global.playtime-global.bpmlist[0][0])*global.globalspeed*0.25)>mouse_y){
						//
						array_push(global.svchange[3][timinggroup],[
						scr_barfind(global.barlist,global.mousetime),
						scr_svset(global.svchange[3][timinggroup],global.svchange[7][timinggroup],scr_barfind(global.barlist,global.mousetime))
						]);
						array_sort(global.svchange[3][timinggroup],function(elm1, elm2){
							return real(elm1[0])-real(elm2[0]);
						});
					}
					else if(global.barline==0&&mouse_y<608){
						array_push(global.svchange[3][timinggroup],[
						global.mousetime,
						scr_svset(global.svchange[3][timinggroup],global.svchange[7][timinggroup],global.mousetime)]
						);
						array_sort(global.svchange[3][timinggroup],function(elm1, elm2){
							return real(elm1[0])-real(elm2[0]);
						});
					}
					scr_cancelsv();
					global.svchoose=[[],[],[],[],[],[],[],[],[],[]];
				}
				else if (mouse_x>617&&mouse_x<716){
					if (global.barline>0&&(608+(global.playtime-global.bpmlist[0][0])*global.globalspeed*0.25)>mouse_y){
						//
						array_push(global.svchange[4][timinggroup],[
						scr_barfind(global.barlist,global.mousetime),
						scr_svset(global.svchange[4][timinggroup],global.svchange[8][timinggroup],scr_barfind(global.barlist,global.mousetime))
						]);
						array_sort(global.svchange[4][timinggroup],function(elm1, elm2){
							return real(elm1[0])-real(elm2[0]);
						});
					}
					else if(global.barline==0&&mouse_y<608){
						array_push(global.svchange[4][timinggroup],[
						global.mousetime,
						scr_svset(global.svchange[4][timinggroup],global.svchange[8][timinggroup],global.mousetime)]
						);
						array_sort(global.svchange[4][timinggroup],function(elm1, elm2){
							return real(elm1[0])-real(elm2[0]);
						});
					}
					scr_cancelsv();
					global.svchoose=[[],[],[],[],[],[],[],[],[],[]];
				}
			}
			
		}
		
		
		if (keyboard_check_pressed(ord("W"))){
			if (mouse_x>311&&mouse_x<715){
				if (global.barline>0&&(608+(global.playtime-global.bpmlist[0][0])*global.globalspeed*0.25)>mouse_y){
					holdinput=scr_barfind(global.barlist,global.mousetime);
					holdtrack=round((mouse_x-257)/102);
				}
				else if((608+(global.playtime)*global.globalspeed*0.25)>mouse_y&&mouse_y<608){
					holdinput=global.mousetime;
					holdtrack=round((mouse_x-257)/102);
				}
			}
		}
		if (keyboard_check_released(ord("W"))&&holdinput>=0){
			var yup;
			if (global.barline>0&&holdinput<scr_barfind(global.barlist,global.mousetime)){
				yup=scr_barfind(global.barlist,global.mousetime);
			}
			else if(global.barline==0&&holdinput<global.mousetime){
				yup=round(global.mousetime);
			}
			else yup=-1;
		
			if yup>0{
				if(timinggroup<0){
				}
				else{
					if(holdtrack==1){
						array_push(global.svchange[5][timinggroup],[holdinput,0,yup-holdinput,0]);
						array_sort(global.svchange[5][timinggroup],function(elm1, elm2){
							return real(elm1[0])-real(elm2[0]);
						});
					}
					else if(holdtrack==2){
						array_push(global.svchange[6][timinggroup],[holdinput,0,yup-holdinput,0]);
						array_sort(global.svchange[6][timinggroup],function(elm1, elm2){
							return real(elm1[0])-real(elm2[0]);
						});
					}
					else if(holdtrack==3){
						array_push(global.svchange[7][timinggroup],[holdinput,0,yup-holdinput,0]);
						array_sort(global.svchange[7][timinggroup],function(elm1, elm2){
							return real(elm1[0])-real(elm2[0]);
						});
					}
					else if(holdtrack==4){
						array_push(global.svchange[8][timinggroup],[holdinput,0,yup-holdinput,0]);
						array_sort(global.svchange[8][timinggroup],function(elm1, elm2){
							return real(elm1[0])-real(elm2[0]);
						});
					}
					scr_cancelsv();
					global.svchoose=[[],[],[],[],[],[],[],[],[],[]];
				}
			}
			holdinput=-1;
		}
		
	}
	
	
}
	
else if (designview==2){
	
	for(var i=0;i<array_length(global.svchange[4]);i++){
		global.chartxmove[i]=scr_svset(global.svchange[4][i],global.svchange[8][i],global.playtime);
	}
	for(var i=0;i<array_length(global.svchange[1]);i++){
		global.chartspeed[i]=scr_svset(global.svchange[1][i],global.svchange[5][i],global.playtime);
	}
	for(var i=0;i<array_length(global.svchange[2]);i++){
		global.chartmoveinspeed[i]=scr_svset(global.svchange[2][i],global.svchange[6][i],global.playtime);
	}
	for(var i=0;i<array_length(global.svchange[3]);i++){
		global.chartmoveinglobal[i]=scr_svset(global.svchange[3][i],global.svchange[7][i],global.playtime);
	}

}	

else if (designview==-1){
	
	
	if (global.mouseonbtn==0){
	
		if (keyboard_check_pressed(ord("Q"))){
			var _tg=timinggroup;
			if(_tg<0){_tg=0;}
			if (mouse_x>311&&mouse_x<715){
				if (global.barline>0&&(608+(global.playtime-global.bpmlist[0][0])*global.globalspeed*0.25)>mouse_y){
					//
					array_push(global.chartread,[
					"RT",scr_barfind(global.barlist,global.mousetime),round((mouse_x-359)/102),_tg,"none"]
					);
					while(array_length(global.chartread[array_length(global.chartread)-1])-4<btn_changerandomnote.randomnumber){
						array_push(global.chartread[array_length(global.chartread)-1],"none");
					}
					array_sort(global.chartread,function(elm1, elm2){
						if real(elm1[1])>real(elm2[1]) return 1;
						else if real(elm1[1])<real(elm2[1]) return -1;
						else if elm1[0]="L" return 1;
						else return -1;
					});
					scr_cancelchart();
					scr_listchange(1);
					if(array_length(global.svchange[1][_tg])==0){
						global.svchange[1][_tg]=[[-9999,1]];
					}
					if(array_length(global.svchange[2][_tg])==0){
						global.svchange[2][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[3][_tg])==0){
						global.svchange[3][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[4][_tg])==0){
						global.svchange[4][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[0][_tg])==0){
						global.svchange[0][_tg]=[[-9999,1]];
					}
				}
				else if((608+(global.playtime)*global.globalspeed*0.25)>mouse_y&&mouse_y<608){
					array_push(global.chartread,[
					"RT",round(global.mousetime),round((mouse_x-359)/102),_tg,"none"]
					);
					while(array_length(global.chartread[array_length(global.chartread)-1])-4<btn_changerandomnote.randomnumber){
						array_push(global.chartread[array_length(global.chartread)-1],"none");
					}
					array_sort(global.chartread,function(elm1, elm2){
						if real(elm1[1])>real(elm2[1]) return 1;
						else if real(elm1[1])<real(elm2[1]) return -1;
						else if elm1[0]="L" return 1;
						else return -1;
					});
					scr_cancelchart();
					scr_listchange(1);
					if(array_length(global.svchange[1][_tg])==0){
						global.svchange[1][_tg]=[[-9999,1]];
					}
					if(array_length(global.svchange[2][_tg])==0){
						global.svchange[2][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[3][_tg])==0){
						global.svchange[3][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[4][_tg])==0){
						global.svchange[4][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[0][_tg])==0){
						global.svchange[0][_tg]=[[-9999,1]];
					}
				}
				global.choose=[];
			}
			
		}
		if (keyboard_check_pressed(ord("W"))){
			var _tg=timinggroup;
			if(_tg<0){_tg=0;}
			if (mouse_x>311&&mouse_x<715){
				if (global.barline>0&&(608+(global.playtime-global.bpmlist[0][0])*global.globalspeed*0.25)>mouse_y){
					//
					array_push(global.chartread,[
					"RA",scr_barfind(global.barlist,global.mousetime),round((mouse_x-359)/102),_tg,"none"]
					);
					while(array_length(global.chartread[array_length(global.chartread)-1])-4<btn_changerandomnote.randomnumber){
						array_push(global.chartread[array_length(global.chartread)-1],"none");
					}
					array_sort(global.chartread,function(elm1, elm2){
						if real(elm1[1])>real(elm2[1]) return 1;
						else if real(elm1[1])<real(elm2[1]) return -1;
						else if elm1[0]="L" return 1;
						else return -1;
					});
					scr_cancelchart();
					scr_listchange(1);
					if(array_length(global.svchange[1][_tg])==0){
						global.svchange[1][_tg]=[[-9999,1]];
					}
					if(array_length(global.svchange[2][_tg])==0){
						global.svchange[2][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[3][_tg])==0){
						global.svchange[3][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[4][_tg])==0){
						global.svchange[4][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[0][_tg])==0){
						global.svchange[0][_tg]=[[-9999,1]];
					}
				}
				else if((608+(global.playtime)*global.globalspeed*0.25)>mouse_y&&mouse_y<608){
					array_push(global.chartread,[
					"RA",round(global.mousetime),round((mouse_x-359)/102),_tg,"none"]
					);
					while(array_length(global.chartread[array_length(global.chartread)-1])-4<btn_changerandomnote.randomnumber){
						array_push(global.chartread[array_length(global.chartread)-1],"none");
					}
					array_sort(global.chartread,function(elm1, elm2){
						if real(elm1[1])>real(elm2[1]) return 1;
						else if real(elm1[1])<real(elm2[1]) return -1;
						else if elm1[0]="L" return 1;
						else return -1;
					});
					scr_cancelchart();
					scr_listchange(1);
					if(array_length(global.svchange[1][_tg])==0){
						global.svchange[1][_tg]=[[-9999,1]];
					}
					if(array_length(global.svchange[2][_tg])==0){
						global.svchange[2][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[3][_tg])==0){
						global.svchange[3][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[4][_tg])==0){
						global.svchange[4][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[0][_tg])==0){
						global.svchange[0][_tg]=[[-9999,1]];
					}
				}
				global.choose=[];
			}
			
		}
		if (keyboard_check_pressed(ord("E"))){
			var _tg=timinggroup;
			if(_tg<0){_tg=0;}
			if (mouse_x>311&&mouse_x<715){
				if (global.barline>0&&(608+(global.playtime-global.bpmlist[0][0])*global.globalspeed*0.25)>mouse_y){
					//
					array_push(global.chartread,[
					"RM",scr_barfind(global.barlist,global.mousetime),round((mouse_x-359)/102),_tg,"none"]
					);
					while(array_length(global.chartread[array_length(global.chartread)-1])-4<btn_changerandomnote.randomnumber){
						array_push(global.chartread[array_length(global.chartread)-1],"none");
					}
					array_sort(global.chartread,function(elm1, elm2){
						if real(elm1[1])>real(elm2[1]) return 1;
						else if real(elm1[1])<real(elm2[1]) return -1;
						else if elm1[0]="L" return 1;
						else return -1;
					});
					scr_cancelchart();
					scr_listchange(1);
					if(array_length(global.svchange[1][_tg])==0){
						global.svchange[1][_tg]=[[-9999,1]];
					}
					if(array_length(global.svchange[2][_tg])==0){
						global.svchange[2][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[3][_tg])==0){
						global.svchange[3][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[4][_tg])==0){
						global.svchange[4][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[0][_tg])==0){
						global.svchange[0][_tg]=[[-9999,1]];
					}
				}
				else if((608+(global.playtime)*global.globalspeed*0.25)>mouse_y&&mouse_y<608){
					array_push(global.chartread,[
					"RM",round(global.mousetime),round((mouse_x-359)/102),_tg,"none"]
					);
					while(array_length(global.chartread[array_length(global.chartread)-1])-4<btn_changerandomnote.randomnumber){
						array_push(global.chartread[array_length(global.chartread)-1],"none");
					}
					array_sort(global.chartread,function(elm1, elm2){
						if real(elm1[1])>real(elm2[1]) return 1;
						else if real(elm1[1])<real(elm2[1]) return -1;
						else if elm1[0]="L" return 1;
						else return -1;
					});
					scr_cancelchart();
					scr_listchange(1);
					if(array_length(global.svchange[1][_tg])==0){
						global.svchange[1][_tg]=[[-9999,1]];
					}
					if(array_length(global.svchange[2][_tg])==0){
						global.svchange[2][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[3][_tg])==0){
						global.svchange[3][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[4][_tg])==0){
						global.svchange[4][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[0][_tg])==0){
						global.svchange[0][_tg]=[[-9999,1]];
					}
				}
				global.choose=[];
			}
			
		}
		if (keyboard_check_pressed(ord("R"))){
			var _tg=timinggroup;
			if(_tg<0){_tg=0;}
			if (mouse_x>311&&mouse_x<715){
				if (global.barline>0&&(608+(global.playtime-global.bpmlist[0][0])*global.globalspeed*0.25)>mouse_y){
					//
					array_push(global.chartread,[
					"RF",scr_barfind(global.barlist,global.mousetime),round((mouse_x-359)/102),_tg,16777215,"none"]
					);
					while(array_length(global.chartread[array_length(global.chartread)-1])-5<btn_changerandomnote.randomnumber){
						array_push(global.chartread[array_length(global.chartread)-1],"none");
					}
					array_sort(global.chartread,function(elm1, elm2){
						if real(elm1[1])>real(elm2[1]) return 1;
						else if real(elm1[1])<real(elm2[1]) return -1;
						else if elm1[0]="L" return 1;
						else return -1;
					});
					scr_cancelchart();
					scr_listchange(1);
					if(array_length(global.svchange[1][_tg])==0){
						global.svchange[1][_tg]=[[-9999,1]];
					}
					if(array_length(global.svchange[2][_tg])==0){
						global.svchange[2][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[3][_tg])==0){
						global.svchange[3][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[4][_tg])==0){
						global.svchange[4][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[0][_tg])==0){
						global.svchange[0][_tg]=[[-9999,1]];
					}
				}
				else if((608+(global.playtime)*global.globalspeed*0.25)>mouse_y&&mouse_y<608){
					array_push(global.chartread,[
					"RF",round(global.mousetime),round((mouse_x-359)/102),_tg,16777215,"none"]
					);
					while(array_length(global.chartread[array_length(global.chartread)-1])-5<btn_changerandomnote.randomnumber){
						array_push(global.chartread[array_length(global.chartread)-1],"none");
					}
					array_sort(global.chartread,function(elm1, elm2){
						if real(elm1[1])>real(elm2[1]) return 1;
						else if real(elm1[1])<real(elm2[1]) return -1;
						else if elm1[0]="L" return 1;
						else return -1;
					});
					scr_cancelchart();
					scr_listchange(1);
					if(array_length(global.svchange[1][_tg])==0){
						global.svchange[1][_tg]=[[-9999,1]];
					}
					if(array_length(global.svchange[2][_tg])==0){
						global.svchange[2][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[3][_tg])==0){
						global.svchange[3][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[4][_tg])==0){
						global.svchange[4][_tg]=[[-9999,0]];
					}
					if(array_length(global.svchange[0][_tg])==0){
						global.svchange[0][_tg]=[[-9999,1]];
					}
				}
				global.choose=[];
			}
			
		}
	}
}

else if (designview==-2){
	if (keyboard_check_pressed(ord("Q"))){
		var _bpm=200;
		for(var i=array_length(global.bpmlist)-1;i>=0;i--){
			if (global.bpmlist[i][0]<global.mousetime){
				_bpm=global.bpmlist[i][1];
				break;
			}
		}
		if (mouse_x>311&&mouse_x<715){
			if (global.barline>0&&(608+(global.playtime-global.bpmlist[0][0])*global.globalspeed*0.25)>mouse_y){
				
				array_push(global.bpmlist,[scr_barfind(global.barlist,global.mousetime),_bpm]);
				array_sort(global.bpmlist,function(elm1, elm2){
					if real(elm1[0])>real(elm2[0]) return 1;
					else if real(elm1[0])<real(elm2[0]) return -1;
				});
			}
			else if((608+(global.playtime)*global.globalspeed*0.25)>mouse_y&&mouse_y<608){
				array_push(global.chartread,[round(global.mousetime),_bpm]);
				array_sort(global.bpmlist,function(elm1, elm2){
					if real(elm1[0])>real(elm2[0]) return 1;
					else if real(elm1[0])<real(elm2[0]) return -1;
				});
			}
			global.choose=[];
		}
			
	}
	
}