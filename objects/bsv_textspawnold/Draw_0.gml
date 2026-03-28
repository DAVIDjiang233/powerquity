draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(global.fontall);
draw_set_colour(txtcolor);

draw_text_transformed(alarm[0]*(mx1-mx2)/alltime+mx2, alarm[0]*(my1-my2)/alltime+my2,textshow,alarm[0]*(ms2-ms1)/alltime+ms1,alarm[0]*(ms1-ms2)/alltime+ms2,0);

