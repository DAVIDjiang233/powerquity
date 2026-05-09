y=yset(endtime);
x=xset(key1,endtime);
if(global.keytouchlist[key1]!=keyamo||global.keytouchlist[key1+1]!=keyamo2||global.keytouchlist[key1+2]!=keyamo3||global.keytouchlist[key1+3]!=keyamo4) exit;

if (global.playtime<endtime-125*global.judgesize) exit;
//miss
if (global.playtime>endtime+125*global.judgesize){
	if(global.autoplay==1) {
		global.judgelist[0]++;
		instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[exjudge*2+254],
			sfps : global.skinnumber[23]
		}
		);
	}
	else {
		global.judgelist[3]++;
		instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[exjudge*5+255],
			sfps : global.skinnumber[23]
		}
		);
	}
	global.keytouchlist[key1]=keyamo+0.5;
	global.keytouchlist[key1+1]=keyamo2+0.5;
	global.keytouchlist[key1+2]=keyamo3+0.5;
	global.keytouchlist[key1+3]=keyamo4+0.5;
	instance_destroy(showdetail);
	instance_create_depth(640,0,-5000,showdetail,{
		stime : global.playtime,
		spr : global.playskin[173],
		sfps : global.skinnumber[23]
	});
	instance_destroy();
}



//press


if (global.pressing[global.pressreal[key1-1]]==3||global.pressing[global.pressreal[key1]]==3
||global.pressing[global.pressreal[key1+1]]==3||global.pressing[global.pressreal[key1+2]]==3){
	if(exjudge==0){
		global.judgelist[0]++;
		instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[254],
			sfps : global.skinnumber[23]
		}
		);
	}
	else{
		instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[judge(endtime)+256],
			sfps : global.skinnumber[23]
		}
		);
		instance_create_depth(640+(global.playtime-endtime)/global.judgesize,global.settings[9],-5000,showhit);
	}
	global.keytouchlist[key1]=keyamo+0.2;
	global.keytouchlist[key1+1]=keyamo2+0.2;
	global.keytouchlist[key1+2]=keyamo3+0.2;
	global.keytouchlist[key1+3]=keyamo4+0.2;
	instance_destroy();
}