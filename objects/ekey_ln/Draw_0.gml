draw_sprite_pos(global.playskin[key1+23],0,
x-(sprite_get_width(global.playskin[key1+23])/2),yup,
x+(sprite_get_width(global.playskin[key1+23])/2),yup,
x+(sprite_get_width(global.playskin[key1+23])/2),ydo,
x-(sprite_get_width(global.playskin[key1+23])/2),ydo,1);
if keytouched==0 draw_sprite(global.playskin[key1+19],0,x,ydo);
if debug_mode{
draw_set_halign(fa_center);
draw_set_font(Font1);
draw_set_colour(c_white);
draw_text(x, ydo, string(keyamo));
}
