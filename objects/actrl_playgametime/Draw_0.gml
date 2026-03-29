if(global.autoplay!=0){
	draw_set_colour(#888888);
	draw_set_alpha(0.02);
	draw_text((global.playtime/80)%1200, 100+500*global.rand[floor(abs(global.playtime/96000))%4], "Auto Play");
	draw_set_alpha(1);
}