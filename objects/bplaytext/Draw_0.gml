var _alpha;
if(depth<=15000&&depth>-15000){
	if(global.drawdepth[floor((15000-depth)/1000)]<=0){
		exit;
	}
	else _alpha=global.drawdepth[floor((15000-depth)/1000)];
}

draw_set_halign(halign);
draw_set_colour(color);
draw_set_valign(fa_middle);
scr_set_font(global.fontall[font]);

var _mx,_my,_msx,_msy,_angle;
if(typeof(mx)=="array"){
	_mx=scr_calc(mx,global.playtime,-10000);
}
else _mx=mx;
if(typeof(my)=="array"){
	_my=scr_calc(my,global.playtime,-10000);
}
else _my=my;
if(typeof(msx)=="array"){
	_msx=scr_calc(msx,global.playtime);
}
else _msx=msx;
if(typeof(msy)=="array"){
	_msy=scr_calc(msy,global.playtime);
}
else _msy=msy;
if(typeof(angle)=="array"){
	_angle=scr_calc(angle,global.playtime);
}
else _angle=angle;

if(typeof(alpha)=="array"){
	_alpha*=scr_calc(alpha,global.playtime);
}
else _alpha*=alpha;

if(global.mirror*mirror>=0.5){
	_mx=1280-_mx;
	_msx=-_msx;
	_angle=-_angle;
}


draw_set_alpha(_alpha);
scr_draw_text(_mx,_my,string_ext(textshow,global.textlist),_msx,_msy,_angle,maxsize);