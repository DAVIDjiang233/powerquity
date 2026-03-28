function scr_svset(_svn,_sv,_time){

	var _svnindex = scr_svget(_svn, _time, 0);
	if(_svnindex<0) return 0;
	else{
		var _svnum=_svn[_svnindex][1];
		var _svstart = scr_svget(_sv, _svn[_svnindex][0]-10000, 0)+1;
		var _svend = scr_svget(_sv, _time, 0);
		//show_debug_message(string(_svn[_svnindex][0])+" "+string(_svstart)+" "+string(_svend));
		
		/*
		_time                             当前timing
		_svn[_svnindex][0]                上一个svn的timing
		_sv[_svstart][0]                  sv起点timing
		_sv[_svstart][2]+_sv[_svstart][0] sv终点timing
		*/
		while(_svstart<=_svend){
			if(_sv[_svstart][2]+_sv[_svstart][0]>_svn[_svnindex][0]){
				if(_sv[_svstart][2]+_sv[_svstart][0]<=_time){
					_svnum+=_sv[_svstart][1];
					if(_sv[_svstart][0]<_svn[_svnindex][0]){
					_svnum-=scr_tcscal(
						_sv[_svstart][0],
						_sv[_svstart][2]+_sv[_svstart][0],
						0,
						_sv[_svstart][1],
						_svn[_svnindex][0],
						_sv[_svstart][3]);
					}
				}
				else{
					_svnum+=scr_tcscal(
						_sv[_svstart][0],
						_sv[_svstart][2]+_sv[_svstart][0],
						0,
						_sv[_svstart][1],
						_time,
						_sv[_svstart][3]);
					if(_sv[_svstart][0]<_svn[_svnindex][0]){
						_svnum-=scr_tcscal(
						_sv[_svstart][0],
						_sv[_svstart][2]+_sv[_svstart][0],
						0,
						_sv[_svstart][1],
						_svn[_svnindex][0],
						_sv[_svstart][3]);
					}
				}
			}
			_svstart++;
		}
		return _svnum;
	}
}