if(x>=668) draw_set_colour(#ff8000);
else if(x<=612) draw_set_colour(#0080ff);
else draw_set_colour(#ff0000);

draw_set_alpha((time-current_time)/1000);
if(global.mirror==1){
	draw_circle(1280-x,global.settings[10],24,0);
}
else{
	draw_circle(x,global.settings[10],24,0);
}
draw_set_colour(c_white);
draw_set_alpha(1);