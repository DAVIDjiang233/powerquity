if global.playtype==1 exit;
if ctrl_playgame.gamepause!=1 exit;


if mouse_check_button_released(mb_left){
	if (pressedtype==0){
		exit;
	}
	if(global.mirror!=1){
		if pressedtype<5{
			if (mouse_y<=y-108+123+24&&mouse_y>=y-108+123-24){
	
				if (mouse_x<=x-180+21+24&&mouse_x>=x-180+21-24) global.pressreal[pressedtype]=ord("1");
				if (mouse_x<=x-180+69+24&&mouse_x>=x-180+69-24) global.pressreal[pressedtype]=ord("2");
				if (mouse_x<=x-180+177+24&&mouse_x>=x-180+177-24) global.pressreal[pressedtype]=ord("3");
				if (mouse_x<=x-180+279+24&&mouse_x>=x-180+279-24) global.pressreal[pressedtype]=ord("4");
			}
		}
		if pressedtype>5{
			if pressedtype==21 pressedtype=1;
			if pressedtype==69 pressedtype=2;
			if pressedtype==177 pressedtype=3;
			if pressedtype==279 pressedtype=4;
		
		
			if (mouse_y<=y-108+69+24&&mouse_y>=y-108+69-24){
	
				if (mouse_x<=x-180+15+24&&mouse_x>=x-180+15-24) global.pressreal[1]=ord(string(pressedtype));
				if (mouse_x<=x-180+105+24&&mouse_x>=x-180+105-24) global.pressreal[2]=ord(string(pressedtype));
				if (mouse_x<=x-180+195+24&&mouse_x>=x-180+195-24) global.pressreal[3]=ord(string(pressedtype));
				if (mouse_x<=x-180+285+24&&mouse_x>=x-180+285-24) global.pressreal[4]=ord(string(pressedtype));
			}
		}
	}
	else{
		if pressedtype<5{
			if (mouse_y<=y-108+123+24&&mouse_y>=y-108+123-24){
	
				if (1280-mouse_x<=x-180+21+24&&1280-mouse_x>=x-180+21-24) global.pressreal[pressedtype]=ord("1");
				if (1280-mouse_x<=x-180+69+24&&1280-mouse_x>=x-180+69-24) global.pressreal[pressedtype]=ord("2");
				if (1280-mouse_x<=x-180+177+24&&1280-mouse_x>=x-180+177-24) global.pressreal[pressedtype]=ord("3");
				if (1280-mouse_x<=x-180+279+24&&1280-mouse_x>=x-180+279-24) global.pressreal[pressedtype]=ord("4");
			}
		}
		if pressedtype>5{
			if pressedtype==21 pressedtype=1;
			if pressedtype==69 pressedtype=2;
			if pressedtype==177 pressedtype=3;
			if pressedtype==279 pressedtype=4;
		
		
			if (mouse_y<=y-108+69+24&&mouse_y>=y-108+69-24){
	
				if (1280-mouse_x<=x-180+15+24&&1280-mouse_x>=x-180+15-24) global.pressreal[1]=ord(string(pressedtype));
				if (1280-mouse_x<=x-180+105+24&&1280-mouse_x>=x-180+105-24) global.pressreal[2]=ord(string(pressedtype));
				if (1280-mouse_x<=x-180+195+24&&1280-mouse_x>=x-180+195-24) global.pressreal[3]=ord(string(pressedtype));
				if (1280-mouse_x<=x-180+285+24&&1280-mouse_x>=x-180+285-24) global.pressreal[4]=ord(string(pressedtype));
			}
		}
	}
	pressedtype=0;
}