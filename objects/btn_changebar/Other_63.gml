
var i_d = ds_map_find_value(async_load, "id");
if (i_d == msg)
{
    if (ds_map_find_value(async_load, "status"))
    {
        if (ds_map_find_value(async_load, "result") != "")
        {
			
			var _num=ds_map_find_value(async_load, "result");
			if (type==0){
				if (scr_stringtreal(_num)==1&&real(_num)>=0.5){
					global.globalspeed=real(_num);
				}
			}
			if (type==1){
					if (scr_stringtreal(_num)==1&&real(_num)>=1){
					global.barline=round(real(_num));
				}
			}
        }
    }
}
