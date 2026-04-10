if keyboard_check(global.pressreal[boardtype]){
	if global.pressreal[boardtype]==ord("1") {
		draw_sprite_ext(global.playskin[32+boardtype],0,x,y,1.,1,0,global.playskin[68],1);
	}
	if global.pressreal[boardtype]==ord("2") {
		draw_sprite_ext(global.playskin[36+boardtype],0,x,y,1.,1,0,global.playskin[69],1);
	}
	if global.pressreal[boardtype]==ord("3") {
		draw_sprite_ext(global.playskin[40+boardtype],0,x,y,1.,1,0,global.playskin[70],1);
	}
	if global.pressreal[boardtype]==ord("4") {
		draw_sprite_ext(global.playskin[44+boardtype],0,x,y,1.,1,0,global.playskin[71],1);
	}
}
else{
	if global.pressreal[boardtype]==ord("1") {
		draw_sprite_ext(global.playskin[48+boardtype],0,x,y,1.,1,0,global.playskin[72],1);
	}
	if global.pressreal[boardtype]==ord("2") {
		draw_sprite_ext(global.playskin[52+boardtype],0,x,y,1.,1,0,global.playskin[73],1);
	}
	if global.pressreal[boardtype]==ord("3") {
		draw_sprite_ext(global.playskin[56+boardtype],0,x,y,1.,1,0,global.playskin[74],1);
	}
	if global.pressreal[boardtype]==ord("4") {
		draw_sprite_ext(global.playskin[60+boardtype],0,x,y,1.,1,0,global.playskin[75],1);
	}
}

//draw_self();
//image_blend = #ffffff;