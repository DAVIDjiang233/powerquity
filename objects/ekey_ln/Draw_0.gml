

if(exjudge==0){
	draw_sprite_pos(global.playskin[key1+23],0,
	x-(sprite_get_width(global.playskin[key1+23])/2),yup,
	x+(sprite_get_width(global.playskin[key1+23])/2),yup,
	x+(sprite_get_width(global.playskin[key1+23])/2),ydo,
	x-(sprite_get_width(global.playskin[key1+23])/2),ydo,global.drawdepth[15]);
	draw_sprite_ext(global.playskin[key1+27],0,x,yup,1,1,0,c_white,global.drawdepth[15]);
	if keytouched==0 draw_sprite_ext(global.playskin[key1+19],0,x,ydo,1,1,0,c_white,global.drawdepth[15]);
}
else{
	draw_sprite_pos(global.playskin[key1+121],0,
	x-(sprite_get_width(global.playskin[key1+121])/2),yup,
	x+(sprite_get_width(global.playskin[key1+121])/2),yup,
	x+(sprite_get_width(global.playskin[key1+121])/2),ydo,
	x-(sprite_get_width(global.playskin[key1+121])/2),ydo,global.drawdepth[15]);
	draw_sprite_ext(global.playskin[key1+125],0,x,yup,1,1,0,c_white,global.drawdepth[15]);
	if keytouched==0 draw_sprite_ext(global.playskin[key1+117],0,x,ydo,1,1,0,c_white,global.drawdepth[15]);
}
if debug_mode{
draw_set_halign(fa_center);
scr_set_font(Font1);
draw_set_colour(c_white);
draw_text(x, ydo, string(keyamo));
}

