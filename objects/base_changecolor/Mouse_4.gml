if global.playtype==1 exit;
if ctrl_playgame.gamepause!=1 exit;


if(global.mirror!=1){
	if (mouse_y<=y-108+69+24&&mouse_y>=y-108+69-24){
	
		if (mouse_x<=x-180+15+24&&mouse_x>=x-180+15-24) pressedtype=1;
		if (mouse_x<=x-180+105+24&&mouse_x>=x-180+105-24) pressedtype=2;
		if (mouse_x<=x-180+195+24&&mouse_x>=x-180+195-24) pressedtype=3;
		if (mouse_x<=x-180+285+24&&mouse_x>=x-180+285-24) pressedtype=4;
	}

	if (mouse_y<=y-108+123+24&&mouse_y>=y-108+123-24){
	
		if (mouse_x<=x-180+21+24&&mouse_x>=x-180+21-24) pressedtype=21;
		if (mouse_x<=x-180+69+24&&mouse_x>=x-180+69-24) pressedtype=69;
		if (mouse_x<=x-180+177+24&&mouse_x>=x-180+177-24) pressedtype=177;
		if (mouse_x<=x-180+279+24&&mouse_x>=x-180+279-24) pressedtype=279;
	}
}
else{
	if (mouse_y<=y-108+69+24&&mouse_y>=y-108+69-24){
	
		if (1280-mouse_x<=x-180+15+24&&1280-mouse_x>=x-180+15-24) pressedtype=1;
		if (1280-mouse_x<=x-180+105+24&&1280-mouse_x>=x-180+105-24) pressedtype=2;
		if (1280-mouse_x<=x-180+195+24&&1280-mouse_x>=x-180+195-24) pressedtype=3;
		if (1280-mouse_x<=x-180+285+24&&1280-mouse_x>=x-180+285-24) pressedtype=4;
	}

	if (mouse_y<=y-108+123+24&&mouse_y>=y-108+123-24){
	
		if (1280-mouse_x<=x-180+21+24&&1280-mouse_x>=x-180+21-24) pressedtype=21;
		if (1280-mouse_x<=x-180+69+24&&1280-mouse_x>=x-180+69-24) pressedtype=69;
		if (1280-mouse_x<=x-180+177+24&&1280-mouse_x>=x-180+177-24) pressedtype=177;
		if (1280-mouse_x<=x-180+279+24&&1280-mouse_x>=x-180+279-24) pressedtype=279;
	}
}