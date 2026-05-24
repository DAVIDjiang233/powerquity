if(global.drawdepth[25]<=0) exit;
draw_set_halign(1);
draw_set_alpha(global.drawdepth[25]);
	
/*scr_draw_text(640, 160, "暂停",1,1,0);
scr_draw_text(640, 290, chr(global.pressext[1])+" / Enter: 继续",0.4,0.4,0);
scr_draw_text(640, 350, "ESC: 退出",0.4,0.4,0);
scr_draw_text(640, 410, chr(global.pressext[0])+": 重玩",0.4,0.4,0);*/

if global.playtype==1 exit;

/*var _x1=1,_x2=21;
draw_set_color(#959595);
while(_x1<=4){
	if global.pressreal[_x1-1]==0 _x2=21;
	if global.pressreal[_x1-1]==1 _x2=69;
	if global.pressreal[_x1-1]==2 _x2=177;
	if global.pressreal[_x1-1]==3 _x2=279;
	draw_line_width(x-255+_x1*90,y-108+69,x-180+_x2,y-108+123,5);
	_x1++;
}*/

draw_set_color(#959595);
for(var _i=1;_i<=4;_i++){
	draw_line_width(
		global.skinnumber[2*_i+32],
		global.skinnumber[2*_i+33],
		global.skinnumber[2*global.pressreal[_i-1]+42],
		global.skinnumber[2*global.pressreal[_i-1]+43],
	5);
}

draw_set_color(#ff0000);
if mouse_check_button(mb_left)&&pressedtype!=0{
	draw_line_width(global.skinnumber[2*pressedtype+32],global.skinnumber[2*pressedtype+33],mouse_x,mouse_y,5);
}

draw_sprite_ext(global.playskin[73+global.pressreal[0]],0,0,0,1,1,0,global.skinnumber[50+global.pressreal[0]],global.drawdepth[5]);
draw_sprite_ext(global.playskin[77+global.pressreal[1]],0,0,0,1,1,0,global.skinnumber[50+global.pressreal[1]],global.drawdepth[5]);
draw_sprite_ext(global.playskin[81+global.pressreal[2]],0,0,0,1,1,0,global.skinnumber[50+global.pressreal[2]],global.drawdepth[5]);
draw_sprite_ext(global.playskin[85+global.pressreal[3]],0,0,0,1,1,0,global.skinnumber[50+global.pressreal[3]],global.drawdepth[5]);

draw_set_color(#ffffff);


if (global.pressing[1]>=2) draw_sprite_ext(global.playskin[412],1,0,0,1,1,0,c_white,global.drawdepth[25]);
else draw_sprite_ext(global.playskin[411],1,0,0,1,1,0,c_white,global.drawdepth[25]);

if (global.pressing[0]<=1)&&(global.pressing[1]<=1)
draw_sprite_ext(global.playskin[413],1,0,0,1,1,0,c_white,global.drawdepth[25]);
else draw_sprite_ext(global.playskin[414],1,0,0,1,1,0,c_white,global.drawdepth[25]);

if (global.pressing[2]>=2) draw_sprite_ext(global.playskin[416],1,0,0,1,1,0,c_white,global.drawdepth[25]);
else draw_sprite_ext(global.playskin[415],1,0,0,1,1,0,c_white,global.drawdepth[25]);

if (global.pressing[3]>=2) draw_sprite_ext(global.playskin[418],1,0,0,1,1,0,c_white,global.drawdepth[25]);
else draw_sprite_ext(global.playskin[417],1,0,0,1,1,0,c_white,global.drawdepth[25]);


draw_set_color(#ffffff);
draw_sprite_ext(global.playskin[72],1,0,0,1,1,0,c_white,global.drawdepth[25])
//draw_self();