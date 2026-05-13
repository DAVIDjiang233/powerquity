if(x<=40&&x>=-40) draw_set_colour(global.skinnumber[30]);
else if(x<=80&&x>=-80) draw_set_colour(global.skinnumber[31]);
else if(x<=125&&x>=-125) draw_set_colour(global.skinnumber[32]);
else draw_set_colour(global.skinnumber[33]);


draw_set_alpha(global.drawdepth[20]*(time-current_time)/1000);
if(global.mirror==1){
	draw_rectangle(1280-global.skinnumber[26]-global.skinnumber[28]-(x*global.skinnumber[29]),global.skinnumber[25]-global.skinnumber[27],1280-global.skinnumber[26]+global.skinnumber[28]-(x*global.skinnumber[29]),global.skinnumber[25]+global.skinnumber[27],false);
}
else{
	draw_rectangle(x*global.skinnumber[29]-global.skinnumber[28]+global.skinnumber[26],global.skinnumber[25]-global.skinnumber[27],x*global.skinnumber[29]+global.skinnumber[28]+global.skinnumber[26],global.skinnumber[25]+global.skinnumber[27],false);
}

draw_set_colour(c_white);
draw_set_alpha(1);