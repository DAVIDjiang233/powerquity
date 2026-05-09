if(x<600){
	instance_destroy(showdetail);
	instance_create_depth(580,0,-5000,showdetail,{
		stime : global.playtime,
		spr : global.playskin[172],
		sfps : global.skinnumber[23]
	});
}
else if(x>680){
	instance_destroy(showdetail);
	instance_create_depth(700,0,-5000,showdetail,{
		stime : global.playtime,
		spr : global.playskin[174],
		sfps : global.skinnumber[23]
	});
}
time=current_time+800;