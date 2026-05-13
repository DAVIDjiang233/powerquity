x=xset(key1,startime);

yup=yset(endtime);
ydo=yset(startime);



if keytouched==0{
	if(global.keytouchlist[key1]!=keyamo) exit;
	if (global.playtime<startime-150*global.judgesize) exit;
	//miss
	if (global.playtime>startime+125*global.judgesize){
		if(global.autoplay==1) {
			global.playtextlist[1]++;
			global.playtextlist[2]++;
			global.playtextlist[3]++;
			global.judgelist[0]++;
			instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
			{
				stime : global.playtime,
				spr : global.playskin[exjudge*20+280+key1],
				sfps : global.skinnumber[23]
			}
			);
			global.keytouchlist[key1]=keyamo+0.5;
			keytouched=3;
		}
		else{
			global.playtextlist[1]=0;
			global.playtextlist[2]=0;
			global.playtextlist[3]=0;
			global.judgelist[3]+=2;
			instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
			{
				stime : global.playtime,
				spr : global.playskin[exjudge*32+284+key1],
				sfps : global.skinnumber[23]
			}
			);
			global.keytouchlist[key1]=keyamo+0.5;
			instance_create_depth((global.playtime-startime)/global.judgesize,global.settings[9],-5000,showhit);
			instance_destroy();
		}
	}
	
	if global.pressing[global.pressreal[key1-1]]==3{
		if(exjudge==0){
			global.playtextlist[1]++;
			global.playtextlist[2]++;
			global.playtextlist[3]++;
			global.judgelist[0]++;
			instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
			{
				stime : global.playtime,
				spr : global.playskin[280+key1],
				sfps : global.skinnumber[23]
			}
			);
		}
		else{
			instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
			{
				stime : global.playtime,
				spr : global.playskin[judge(startime)*4+300+key1],
				sfps : global.skinnumber[23]
			}
			);
			instance_create_depth((global.playtime-startime)/global.judgesize,global.settings[9],-5000,showhit);
		}
		
		global.keytouchlist[key1]=keyamo+0.5;
		
		keytouched=1;
	}
}
else if(keytouched==3){
	ydo=global.skinnumber[2];
	if endtime<global.playtime {
		global.playtextlist[1]++;
		global.playtextlist[2]++;
		global.playtextlist[3]++;
		global.judgelist[0]++;
		instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[exjudge*32+292+key1],
			sfps : global.skinnumber[23]
		}
		);
		instance_destroy();
	}
}
else{
	
	if global.pressing[global.pressreal[key1-1]]>=2{
		ydo=global.skinnumber[2];
		if endtime<global.playtime {
			global.playtextlist[1]++;
			global.playtextlist[2]++;
			global.playtextlist[3]++;
			global.judgelist[0]++;
			instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
			{
				stime : global.playtime,
				spr : global.playskin[exjudge*32+292+key1],
				sfps : global.skinnumber[23]
			}
			);
			instance_destroy();
		}
	}
	else{
		if endtime-125*global.judgesize<global.playtime {
			global.playtextlist[1]++;
			global.playtextlist[2]++;
			global.playtextlist[3]++;
			global.judgelist[0]++;
			instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
			{
				stime : global.playtime,
				spr : global.playskin[exjudge*32+292+key1],
				sfps : global.skinnumber[23]
			}
			);
			instance_destroy();
		}
		else {
			global.playtextlist[1]=0;
			global.playtextlist[2]=0;
			global.playtextlist[3]=0;
			global.judgelist[3]++;
			instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
			{
				stime : global.playtime,
				spr : global.playskin[exjudge*32+296+key1],
				sfps : global.skinnumber[23]
			}
			);
			instance_destroy(showdetail);
			instance_create_depth(640,0,-5000,showdetail,{
		stime : global.playtime,
		spr : global.playskin[173],
		sfps : global.skinnumber[23]
	});
			instance_destroy();
		}
	}
}










//keyamo<=global(前一个note被按下)
//keytouched==0(前一个note在ln判断范围内)


