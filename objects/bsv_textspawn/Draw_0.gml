draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(global.fontall);
draw_set_colour(txtcolor);
draw_set_alpha(scr_tcscal(stime,etime,ma1,ma2,global.playtime,ea));

draw_text_transformed(
	scr_tcscal(stime,etime,mx1,mx2,global.playtime,ex),
	scr_tcscal(stime,etime,my1,my2,global.playtime,ey)+
	scr_tcscal(stime,etime,mgy1,mgy2,global.playtime,egy)*global.globalspeed,
	textshow,
	scr_tcscal(stime,etime,msx1,msx2,global.playtime,esx),
	scr_tcscal(stime,etime,msy1,msy2,global.playtime,esy),
	scr_tcscal(stime,etime,mr1,mr2,global.playtime,er));

draw_set_alpha(1);