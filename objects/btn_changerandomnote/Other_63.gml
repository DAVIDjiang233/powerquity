
var i_d = ds_map_find_value(async_load, "id");
if (i_d == msg)
{
    if (ds_map_find_value(async_load, "status"))
    {
        if (ds_map_find_value(async_load, "result") != "")
        {
			
			var _num=ds_map_find_value(async_load, "result");
			if (scr_stringtreal(_num)==1&&real(_num)>0){
				if (array_length(global.choose)==0){
					randomnumber=real(_num);
				}
				else{
					for (var i=0;i<array_length(global.choose);i++){
						var _j=4;
						if(global.chartread[global.choose[i]][0]=="RF") _j=5;
						while(array_length(global.chartread[global.choose[i]])>real(_num)+_j){
							array_pop(global.chartread[global.choose[i]]);
						}
						while(array_length(global.chartread[global.choose[i]])<real(_num)+_j){
							array_push(global.chartread[global.choose[i]],0);
						}
					}
					scr_cancelchart();
				}
			}
        }
    }
}
