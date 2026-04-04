
var i_d = ds_map_find_value(async_load, "id");
if (i_d == msg)
{
    if (ds_map_find_value(async_load, "status"))
    {
        if (ds_map_find_value(async_load, "result") != "")
        {
			
			var _num=ds_map_find_value(async_load, "result");
			if (type==1){
				if (scr_stringtreal(_num)==1){
					scr_tgsetnum(ctrl_chartdesign.timinggroup,real(_num),0);	
				
					array_sort(global.svchange[0][ctrl_chartdesign.timinggroup],function(elm1, elm2){
						return real(elm1[0])-real(elm2[0]);
					});
					array_sort(global.svchange[5][ctrl_chartdesign.timinggroup],function(elm1, elm2){
						return real(elm1[0])-real(elm2[0]);
					});
					array_sort(global.svchange[6][ctrl_chartdesign.timinggroup],function(elm1, elm2){
						return real(elm1[0])-real(elm2[0]);
					});
					array_sort(global.svchange[7][ctrl_chartdesign.timinggroup],function(elm1, elm2){
						return real(elm1[0])-real(elm2[0]);
					});
					array_sort(global.svchange[8][ctrl_chartdesign.timinggroup],function(elm1, elm2){
						return real(elm1[0])-real(elm2[0]);
					});
					array_sort(global.svchange[1][ctrl_chartdesign.timinggroup],function(elm1, elm2){
						return real(elm1[0])-real(elm2[0]);
					});
					array_sort(global.svchange[2][ctrl_chartdesign.timinggroup],function(elm1, elm2){
						return real(elm1[0])-real(elm2[0]);
					});
					array_sort(global.svchange[3][ctrl_chartdesign.timinggroup],function(elm1, elm2){
						return real(elm1[0])-real(elm2[0]);
					});
					array_sort(global.svchange[4][ctrl_chartdesign.timinggroup],function(elm1, elm2){
						return real(elm1[0])-real(elm2[0]);
					});
					global.svchoose=[[],[],[],[],[],[],[],[],[],[]];
					scr_cancelsv();
				}
			}
			else if (type==2){
				if (scr_stringtreal(_num)==1){
					scr_tgsetnum(ctrl_chartdesign.timinggroup,real(_num),1);
					scr_cancelsv();
				}
			}
			else if (type==3){
				if (scr_stringtreal(_num)==1){
					scr_tgsetnum(ctrl_chartdesign.timinggroup,real(_num),2);
					scr_cancelsv();
				}
			}
			else if (type==4){
				scr_tgsetnum(ctrl_chartdesign.timinggroup,scr_nibl(_num),3);
				scr_cancelsv();
			}
        }
    }
}
keyboard_key_release(vk_control);