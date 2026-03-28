if global.chart+numb<0 exit;
if global.chart+numb>=array_length(global.filelist) exit;

draw_self();
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_set_font(global.fontall);
draw_set_colour(c_white);
draw_text_transformed(x, y+5, string_split(global.filelist[global.chart+numb],".")[0],0.4,0.4,0);