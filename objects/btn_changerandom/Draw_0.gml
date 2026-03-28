draw_set_alpha(1);
draw_self();
draw_set_colour(c_white)
draw_set_halign(fa_middle);
draw_text_transformed(x,y,"随机组"+string(type)+":"+string(global.rand[type]),0.22,0.22,0);