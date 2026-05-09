var _mx,_my,_msx,_msy,_angle,_alpha;
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
	_alpha=scr_calc(alpha,global.playtime);
}
else _alpha=alpha;

if(global.mirror*mirror==1){
	_mx=1280-_mx;
	_msx=-_msx;
	_angle=-_angle;
}

draw_sprite_ext(spr,floor((global.playtime)*sprfps/1000),_mx,_my,_msx,_msy,_angle,color,_alpha);