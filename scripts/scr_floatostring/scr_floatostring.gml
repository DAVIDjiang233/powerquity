function scr_floatostring(_float){
	//if(scr_stringtreal(_float)==0) return(string(_float));
	var i=0;
	while(i<5){
		if real(string_format(_float, 0, i))==(string_format(_float, 0, 5)) break;
		i++;
	}
	return string_format(_float, 0, i);
}