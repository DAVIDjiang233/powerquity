function scr_svget(_sv,_time,_type){
	if(array_length(_sv)==0) return -1;
	var _max=array_length(_sv)-1,_min=0;
	while(_max>_min){
		var _mid=ceil((_max+_min)/2);
		if (_sv[_mid][_type]<=_time){
			_min=_mid;
		}
		else{
			_max=_mid-1;
		}
	}
		if (_sv[_max][_type]>_time){
			_max-=1;
		}
	
	return (_max);
}