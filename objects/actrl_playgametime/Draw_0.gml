if(global.autoplay!=0){
	draw_set_colour(#050505);
	draw_text((global.playtime/80)%1200, 100+500*global.rand[floor(abs(global.playtime/96000))%4], "Auto Play");
}