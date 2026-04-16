if ctrl_playgame.gamepause!=1 exit;

draw_set_colour(c_black);
draw_set_alpha(0.4);
draw_rectangle(0,0,2222,2222,0);

draw_set_colour(c_white);
draw_set_alpha(1);
	
draw_text_transformed(640, 160, "暂停",1,1,0);
draw_text_transformed(640, 290, chr(global.pressext[1])+" / Enter: 继续",0.4,0.4,0);
draw_text_transformed(640, 350, "ESC: 退出",0.4,0.4,0);
draw_text_transformed(640, 410, chr(global.pressext[0])+": 重玩",0.4,0.4,0);

if global.playtype==1 exit;

var _x1=1,_x2=21;
draw_set_color(#959595);
while(_x1<=4){
	if global.pressreal[_x1]==ord("1") _x2=21;
	if global.pressreal[_x1]==ord("2") _x2=69;
	if global.pressreal[_x1]==ord("3") _x2=177;
	if global.pressreal[_x1]==ord("4") _x2=279;
	draw_line_width(x-255+_x1*90,y-108+69,x-180+_x2,y-108+123,5);
	_x1++;
}

draw_set_color(#ff0000);
if mouse_check_button(mb_left)&&pressedtype!=0{
	if (pressedtype<5) draw_line_width(x-255+pressedtype*90,y-108+69,mouse_x,mouse_y,5);
	else draw_line_width(x-180+pressedtype,y-108+123,mouse_x,mouse_y,5);
}

if global.pressreal[1]==ord("1") draw_set_color(#ff3333);
if global.pressreal[1]==ord("2") draw_set_color(#ff7733);
if global.pressreal[1]==ord("3") draw_set_color(#33aa33);
if global.pressreal[1]==ord("4") draw_set_color(#3333ff);
draw_rectangle(x-180+6,y-108+24,x-180+24,y-108+42,0);

if global.pressreal[2]==ord("1") draw_set_color(#ff3333);
if global.pressreal[2]==ord("2") draw_set_color(#ff7733);
if global.pressreal[2]==ord("3") draw_set_color(#33aa33);
if global.pressreal[2]==ord("4") draw_set_color(#3333ff);
draw_rectangle(x-180+96,y-108+24,x-180+114,y-108+42,0);

if global.pressreal[3]==ord("1") draw_set_color(#ff3333);
if global.pressreal[3]==ord("2") draw_set_color(#ff7733);
if global.pressreal[3]==ord("3") draw_set_color(#33aa33);
if global.pressreal[3]==ord("4") draw_set_color(#3333ff);
draw_rectangle(x-180+186,y-108+24,x-180+204,y-108+42,0);

if global.pressreal[4]==ord("1") draw_set_color(#ff3333);
if global.pressreal[4]==ord("2") draw_set_color(#ff7733);
if global.pressreal[4]==ord("3") draw_set_color(#33aa33);
if global.pressreal[4]==ord("4") draw_set_color(#3333ff);
draw_rectangle(x-180+276,y-108+24,x-180+294,y-108+42,0);

draw_set_color(#ffffff);

if keyboard_check(ord("2")) draw_sprite_ext(spr_presser1,1,x-180+45,y-108+183,1,1,-90,c_white,1);
else draw_sprite_ext(spr_presser1,1,x-180+45,y-108+183,1,-1,-90,c_white,1);

if keyboard_check(ord("3")) draw_sprite_ext(spr_presser1,1,x-180+201,y-108+183,1,-1,-90,c_white,1);
else draw_sprite_ext(spr_presser1,1,x-180+201,y-108+183,1,1,-90,c_white,1);

if keyboard_check(ord("4")) draw_sprite_ext(spr_presser1,1,x-180+303,y-108+183,1,-1,-90,c_white,1);
else draw_sprite_ext(spr_presser1,1,x-180+303,y-108+183,1,1,-90,c_white,1);

if !keyboard_check(ord("1"))&&!keyboard_check(ord("2"))
draw_sprite_ext(spr_presser1,1,x-180+141,y-108+207,1,1,0,c_white,1);
else draw_sprite_ext(spr_presser2,1,x-180+141,y-108+207,1,1,0,c_white,1);

draw_set_color(#ffffff);
draw_self();