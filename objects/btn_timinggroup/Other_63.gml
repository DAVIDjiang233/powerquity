
var i_d = ds_map_find_value(async_load, "id");
if (i_d == msg)
{
    if (ds_map_find_value(async_load, "status"))
    {
        if (ds_map_find_value(async_load, "result") != "")
        {
			
			var _num=ds_map_find_value(async_load, "result");
			if(scr_stringtreal(_num)==1){
				if(real(_num)>=0) {
					ctrl_chartdesign.timinggroup=floor(real(_num));
					scr_tgset(ctrl_chartdesign.timinggroup);
					global.svchoose=[[],[],[],[],[],[],[],[],[],[]];
				}
				else {
					ctrl_chartdesign.timinggroup=-1;
					global.svchoose=[[],[],[],[],[],[],[],[],[],[]];
				}
			}
        }
    }
}
