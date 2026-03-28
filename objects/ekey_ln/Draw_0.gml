draw_sprite_pos(spr_lnkey,0,x-36,yup,x+36,yup,x+36,ydo,x-36,ydo,0.7);
if keytouched==0 draw_sprite(spr_tap,0,x,ydo);
if debug_mode{
draw_set_halign(fa_center);
draw_set_font(Font1);
draw_set_colour(c_white);
draw_text(x, ydo, string(keyamo));
}