draw_set_alpha(1);
draw_self();
draw_set_colour(c_white)
draw_set_halign(fa_middle);
scr_draw_text(x,y,"音频延迟:"+string(ctrl_chartdesign.delay),0.22,0.22,0);
