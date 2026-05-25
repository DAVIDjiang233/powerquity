if(changekey==1){
	changekey=0;
}
else{
	if(setbase<=1){
		changekey=1;
	}
	else if(setbase==2){
		/*if settype==1{
			if global.settings[7]==0 global.settings[7]=1;
			else global.settings[7]=0;
		}
		else */
		if settype==2{
			if global.settings[8]==0 global.settings[8]=1;
			else global.settings[8]=0;
		}
		else if settype==3{
			if global.settings[9]==0 global.settings[9]=1;
			else global.settings[9]=0;
		}
		else if settype==4{
			if global.settings[10]==0 global.settings[10]=1;
			else global.settings[10]=0;
		}
		else if settype==6{
			url_open("https://github.com/DAVIDjiang233/powerquity");
		}
		else changekey=1;
	}
	else if(setbase==3){
		if settype==1{
			if global.settings[12]==0 global.settings[12]=1;
			else global.settings[12]=0;
		}
		else if settype==2{
			if global.settings[11]==0 global.settings[11]=1;
			else global.settings[11]=0;
		}
		else changekey=1;
	}
}

/*if(settype>=2&&settype<=5){
	changekey=1;
}
else if settype==7{
	if global.settings[7]==0 global.settings[7]=1;
	else global.settings[7]=0;
}
else if settype==11{
	if global.settings[11]==0 global.settings[11]=1;
	else global.settings[11]=0;
}
else if settype==12{
	if global.settings[12]==0 global.settings[12]=1;
	else global.settings[12]=0;
}
else if(settype>=13&&settype<=16){
	changekey=1;
}
else if (settype==array_length(global.settings)-3){
	url_open("https://github.com/DAVIDjiang233/powerquity");
}*/