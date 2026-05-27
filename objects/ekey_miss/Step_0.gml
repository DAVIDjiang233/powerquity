y=yset(endtime);
x=xset(key1,endtime);

if (global.playtime<endtime-15*global.judgesize) exit;
//miss
if (global.playtime>endtime+15*global.judgesize){
	global.textlist[2]++;
	global.textlist[3]++;
	global.textlist[4]++;
	global.textlist[10]++;
	instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[210+key1],
			sfps : global.skinnumber[23]
		}
	);
	instance_destroy();
}



//press
if global.pressing[global.pressreal[key1-1]]>=2{
		global.textlist[2]=0;
		global.textlist[3]=0;
		global.textlist[4]=0;
		global.textlist[13]++;
		instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
			{
				stime : global.playtime,
				spr : global.playskin[214+key1],
				sfps : global.skinnumber[23]
			}
		);
		instance_destroy(showdetail);
		instance_create_depth(640,0,-5000,showdetail,{
		stime : global.playtime,
		spr : global.playskin[173],
		sfps : global.skinnumber[23]
		});
		global.textlist[26]++;
		instance_destroy();
}

