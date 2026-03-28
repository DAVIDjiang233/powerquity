draw_self();
if debug_mode{
draw_set_halign(fa_center);
draw_set_font(Font1);
draw_set_colour(c_white);
draw_text(x, y+20, string(keyamo));
draw_text(x+100, y+20, string(keyamo2));
draw_text(x+200, y+20, string(keyamo3));
draw_text(x+300, y+20, string(keyamo4));
}