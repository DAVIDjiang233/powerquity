if global.pressing[global.pressreal[boardtype-1]]>=2{
	if global.pressreal[boardtype-1]==0 {
		draw_sprite_ext(global.playskin[36+boardtype],0,x,y,1.,1,0,global.skinnumber[3],1);
	}
	if global.pressreal[boardtype-1]==1 {
		draw_sprite_ext(global.playskin[40+boardtype],0,x,y,1.,1,0,global.skinnumber[4],1);
	}
	if global.pressreal[boardtype-1]==2 {
		draw_sprite_ext(global.playskin[44+boardtype],0,x,y,1.,1,0,global.skinnumber[5],1);
	}
	if global.pressreal[boardtype-1]==3 {
		draw_sprite_ext(global.playskin[48+boardtype],0,x,y,1.,1,0,global.skinnumber[6],1);
	}
}
else{
	if global.pressreal[boardtype-1]==0 {
		draw_sprite_ext(global.playskin[52+boardtype],0,x,y,1.,1,0,global.skinnumber[7],1);
	}
	if global.pressreal[boardtype-1]==1 {
		draw_sprite_ext(global.playskin[56+boardtype],0,x,y,1.,1,0,global.skinnumber[8],1);
	}
	if global.pressreal[boardtype-1]==2 {
		draw_sprite_ext(global.playskin[60+boardtype],0,x,y,1.,1,0,global.skinnumber[9],1);
	}
	if global.pressreal[boardtype-1]==3 {
		draw_sprite_ext(global.playskin[64+boardtype],0,x,y,1.,1,0,global.skinnumber[10],1);
	}
}

//draw_self();
//image_blend = #ffffff;