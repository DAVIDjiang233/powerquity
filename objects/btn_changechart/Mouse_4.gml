var _text="",_num="";
if type==0{
	_text="曲名";
	_num=global.fileread[0];
}
else if type==1{
	_text="曲师";
	_num=global.fileread[1];
}
else if type==2{
	_text="BPM";
	_num=global.fileread[2];
}
else if type==3{
	_text="谱师";
	_num=global.fileread[global.level*2+3];
}
else if type==4{
	_text="难度名";
	_num=global.fileread[global.level*2+4];
}
msg = get_integer_async("请输入"+_text, _num);