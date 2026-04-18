y=yset(endtime);
x=xset(key1,endtime);

if (global.playtime<endtime-15*global.judgesize) exit;
//miss
if (global.playtime>endtime+15*global.judgesize){
	global.judgelist[0]++;
	instance_create_depth(global.playskin[70]*(key1-2.5)+640,global.playskin[71],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[210+key1],
			sfps : global.playskin[411]
		}
	);
	instance_destroy();
}



//press
if keyboard_check(global.pressreal[key1]){
		global.judgelist[3]++;
		instance_create_depth(global.playskin[70]*(key1-2.5)+640,global.playskin[71],-3000,showhitlighting,
			{
				stime : global.playtime,
				spr : global.playskin[214+key1],
				sfps : global.playskin[411]
			}
		);
		instance_destroy(showdetail);
		instance_create_depth(640,0,-5000,showdetail);
		instance_destroy();
}

