
var i_d = ds_map_find_value(async_load, "id");
if (i_d == msg)
{
    if (ds_map_find_value(async_load, "status"))
    {
        if (ds_map_find_value(async_load, "result") != "")
        {
			
			var _num=ds_map_find_value(async_load, "result");
			if (type==0){
				if (scr_stringtreal(_num)==1&&real(_num)>=0){
					global.bpmlist[global.choose[0]][0]=round(real(_num));
					array_sort(global.bpmlist,function(elm1, elm2){
						if real(elm1[0])>real(elm2[0]) return 1;
						else if real(elm1[0])<real(elm2[0]) return -1;
					});
					global.choose=[];
				}
			}
			if (type==1){
				if (scr_stringtreal(_num)==1&&real(_num)>0){
					global.bpmlist[global.choose[0]][1]=real(_num);
				}
			}
        }
    }
}
