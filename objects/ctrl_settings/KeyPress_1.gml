if changekey!=1 exit;
if ord(keyboard_lastchar)==vk_escape{
	changekey=0;
	exit;
}
if(setbase<=1){
	if ord(keyboard_lastchar)==13 exit;
	var _q=ord(keyboard_lastchar)
	if(97<=_q&&_q<=122) _q=_q-32;
	if(44<=_q&&_q<=47) _q=_q+144;
	if(_q==39) _q=1;
	if(_q==59) _q=186;
	if(91<=_q&&_q<=93) _q=_q+128;
	if(setbase==0){
		global.settings[settype+2]=_q;
	}
	else if(setbase==1){
		global.settings[settype+13]=_q;
	}
	changekey=0;
}
