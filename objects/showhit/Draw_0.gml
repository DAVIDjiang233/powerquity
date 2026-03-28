if(x<=680&&x>=600) draw_set_colour(c_gray);
else if(x<=720&&x>=560) draw_set_colour(#bbff00);
else if(x<=765&&x>=515) draw_set_colour(#00ffff);
else draw_set_colour(#ff0000);


draw_set_alpha((time-current_time)/1000);
if(global.mirror==1){
	draw_rectangle(1279-x,y-10,1281-x,y+10,false);
}
else{
	draw_rectangle(x-1,y-10,x+1,y+10,false);
}

draw_set_colour(c_white);
draw_set_alpha(1);