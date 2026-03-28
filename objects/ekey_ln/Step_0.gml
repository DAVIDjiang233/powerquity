x=xset(key1,startime);

yup=yset(endtime);
ydo=yset(startime);



if keytouched==0{
	if(global.keytouchlist[key1]!=keyamo) exit;
	if (global.playtime<startime-150*global.judgesize) exit;
	//miss
	if (global.playtime>startime+125*global.judgesize){
		if(global.autoplay==1) {
			global.judgelist[0]++;
			global.keytouchlist[key1]=keyamo+0.5;
			keytouched=3;
		}
		else{
			global.judgelist[3]+=2;
			global.keytouchlist[key1]=keyamo+0.5;
			instance_create_depth(640+(global.playtime-startime)/global.judgesize,global.settings[9],-1145,showhit);
			instance_destroy();
		}
	}
	
	if keyboard_check_pressed(global.pressreal[key1]){
		judge(startime);
		global.keytouchlist[key1]=keyamo+0.5;
		instance_create_depth(640+(global.playtime-startime)/global.judgesize,global.settings[9],-1145,showhit);
		keytouched=1;
	}
}
else if(keytouched==3){
	ydo=608;
	if endtime<global.playtime {
		global.judgelist[0]++;
		instance_destroy();
	}
}
else{
	
	if keyboard_check(global.pressreal[key1]){
		ydo=608;
		if endtime<global.playtime {
			global.judgelist[0]++;
			instance_destroy();
		}
	}
	else{
		if endtime-125*global.judgesize<global.playtime {
			global.judgelist[0]++;
			instance_destroy();
		}
		else {
			global.judgelist[3]++;
			instance_destroy(showdetail);
			instance_create_depth(640,0,-1145,showdetail);
			instance_destroy();
		}
	}
}










//keyamo<=global(前一个note被按下)
//keytouched==0(前一个note在ln判断范围内)


