draw_set_alpha(1);
draw_self();
draw_set_colour(c_white)
draw_set_halign(fa_middle);
draw_text_transformed(x,y,"音频延迟:"+string(ctrl_chartdesign.delay),0.22,0.22,0);
