function scr_drawline(_st,_et,_sx,_ex,_ease){
		if _st==_et exit;
		var _sxn,_exn;
		var i=_st
		if(i>900) i=900;
		while(i-5>_et&&i>-20){
			
			_sxn=scr_tcscal(_st,_et,_sx,_ex,i,_ease);
			_exn=scr_tcscal(_st,_et,_sx,_ex,i-4,_ease);
			draw_line_width(_sxn,i,_exn,i-4,5);
			i-=4
		}
		_sx=scr_tcscal(_st,_et,_sx,_ex,i,_ease);
		draw_line_width(_sx,i,_ex,_et,5);
}