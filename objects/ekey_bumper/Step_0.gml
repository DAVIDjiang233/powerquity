y=scr_yset(endtime);
x=xset(key1,endtime);
if(global.textlist[20+key1]!=keyamo||global.textlist[21+key1]!=keyamo2) exit;

if (global.playtime<endtime-125*global.judgesize) exit;
//miss
if (global.playtime>endtime+125*global.judgesize){
	if(global.autoplay==1) {
		global.textlist[2]++;
		global.textlist[3]++;
		global.textlist[4]++;
		if(global.textlist[2]>global.textlist[39]) global.textlist[39]=global.textlist[2];
		if(global.textlist[3]>global.textlist[40]) global.textlist[40]=global.textlist[3];
		if(global.textlist[4]>global.textlist[41]) global.textlist[41]=global.textlist[4];
		global.textlist[10]++;
		instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[exjudge*6+218+key1],
			sfps : global.skinnumber[23]
		}
		);
	}
	else {
		global.textlist[2]=0;
		global.textlist[3]=0;
		global.textlist[4]=0;
		global.textlist[13]++;
		instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[exjudge*15+221+key1],
			sfps : global.skinnumber[23]
		}
		);
	}
	global.textlist[20+key1]=keyamo+0.5;
	global.textlist[21+key1]=keyamo2+0.5;
	instance_destroy(showdetail);
	instance_create_depth(640,0,-5000,showdetail,{
		stime : global.playtime,
		spr : global.playskin[173],
		sfps : global.skinnumber[23]
	});
	global.textlist[26]++;
	instance_destroy();
}



//press


if (global.pressing[global.pressreal[key1]]==3||global.pressing[global.pressreal[key1-1]]==3){
	if(exjudge==0){
		global.textlist[2]++;
		global.textlist[3]++;
		global.textlist[4]++;
		if(global.textlist[2]>global.textlist[39]) global.textlist[39]=global.textlist[2];
		if(global.textlist[3]>global.textlist[40]) global.textlist[40]=global.textlist[3];
		if(global.textlist[4]>global.textlist[41]) global.textlist[41]=global.textlist[4];
		global.textlist[10]++;
		instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[218+key1],
			sfps : global.skinnumber[23]
		}
		);
	}
	else{
		instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[scr_judge(endtime)*3+224+key1],
			sfps : global.skinnumber[23]
		}
		);
		instance_create_depth((global.playtime-endtime)/global.judgesize,global.settings[9],-5000,showhit);
	}
	global.textlist[20+key1]=keyamo+0.4;
	global.textlist[21+key1]=keyamo2+0.4;
	instance_destroy();
}