y=scr_yset(endtime);
x=xset(key1,endtime);

if (global.playtime<endtime-150) exit;
//miss
if(global.autoplay==1){
	if (global.playtime>endtime){
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
			spr : global.playskin[202+key1],
			sfps : global.skinnumber[23]
		}
	);
	instance_destroy();
	}
}
else if (global.playtime>endtime+125){
	global.textlist[2]=0;
	global.textlist[3]=0;
	global.textlist[4]=0;
	global.textlist[13]++;
	instance_create_depth(global.skinnumber[1]*(key1-2.5)+640,global.skinnumber[2],-3000,showhitlighting,
		{
			stime : global.playtime,
			spr : global.playskin[206+key1],
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


//press
if global.pressing[global.pressreal[key1-1]]>=2{
	judged=1;
}
if(global.playtime>endtime&&judged==1){
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
			spr : global.playskin[202+key1],
			sfps : global.skinnumber[23]
		}
	);
	instance_destroy();
}
