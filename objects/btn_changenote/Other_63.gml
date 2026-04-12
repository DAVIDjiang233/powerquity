
var i_d = ds_map_find_value(async_load, "id");
if (i_d == msg)
{
    if (ds_map_find_value(async_load, "status"))
    {
        if (ds_map_find_value(async_load, "result") != "")
        {
			
			var _num=ds_map_find_value(async_load, "result");
			if (type==1){
				if (scr_stringtreal(_num)==1&&real(_num)>=0){
					for (var i=0;i<array_length(global.choose);i++){
						global.chartread[global.choose[i]][1]=round(real(_num));
					}
					
					array_sort(global.chartread,function(elm1, elm2){
						if real(elm1[1])>real(elm2[1]) return 1;
						else if real(elm1[1])<real(elm2[1]) return -1;
						else if elm1[0]="L" return 1;
						else return -1;
					});
					global.list=0;
					scr_cancelchart();
					scr_listchange(1);
					global.choose=[];
					
				}
				
			}
			else if (type==2){
				if (scr_stringtreal(_num)==1){
					
					var _vist=0;
					for (var i=0;i<array_length(global.choose);i++){
						if (global.chartread[global.choose[i]][0]!="F"&&global.chartread[global.choose[i]][0]!="RF"&&global.chartread[global.choose[i]][0]!="L"&&global.chartread[global.choose[i]][0]!="B"){
						_vist=1;
						break;
						}
					}
					if(_vist==0){
						for (var i=0;i<array_length(global.choose);i++){
							if(global.chartread[global.choose[i]][0]=="RF"){
								global.chartread[global.choose[i]][5+floor(global.rand[real(global.chartread[global.choose[i]][2])]*(array_length(global.chartread[global.choose[i]])-5))]=real(_num);
							}
							else{
								global.chartread[global.choose[i]][2]=real(_num);
							}
						}
					}
					else if(real(_num)>=1&&real(_num)<=4){
						for (var i=0;i<array_length(global.choose);i++){
							
							if(global.chartread[global.choose[i]][0]=="RT"||global.chartread[global.choose[i]][0]=="RM"||global.chartread[global.choose[i]][0]=="RA"){
								global.chartread[global.choose[i]][4+floor(global.rand[real(global.chartread[global.choose[i]][2])]*(array_length(global.chartread[global.choose[i]])-4))]=round(real(_num));
							}
							else if(global.chartread[global.choose[i]][0]=="RF"){
								global.chartread[global.choose[i]][5+floor(global.rand[real(global.chartread[global.choose[i]][2])]*(array_length(global.chartread[global.choose[i]])-5))]=round(real(_num));
							}
							else{
								global.chartread[global.choose[i]][2]=round(real(_num));
							}
							
						}
					}
					scr_cancelchart();
				}
				else if(_num="none"||_num="n"){
					for (var i=0;i<array_length(global.choose);i++){
							
						if(global.chartread[global.choose[i]][0]=="RT"||global.chartread[global.choose[i]][0]=="RM"||global.chartread[global.choose[i]][0]=="RA"){
							global.chartread[global.choose[i]][4+floor(global.rand[real(global.chartread[global.choose[i]][2])]*(array_length(global.chartread[global.choose[i]])-4))]="none";
						}
						else if(global.chartread[global.choose[i]][0]=="RF"){
							global.chartread[global.choose[i]][5+floor(global.rand[real(global.chartread[global.choose[i]][2])]*(array_length(global.chartread[global.choose[i]])-5))]="none";
						}
							
					}
					scr_cancelchart();
				}
			}
			else if (type==3){
				if (scr_stringtreal(_num)==1&&real(_num)>=0){
					for (var i=0;i<array_length(global.choose);i++){
						global.chartread[global.choose[i]][3]=round(real(_num));
					}
					ctrl_chartdesign.timinggroup=round(real(_num));
					scr_cancelchart();
				}
			}
			else if (type==4){
				//if (global.chartread[global.choose[0]][0]=="RF"||global.chartread[global.choose[0]][0]=="F"){
				var _str = string_replace_all(_num, "#", "");
				if (string_length(_str) == 6) {
				    _str = string_lower(_str);
					var r_hex = string_copy(_str, 1, 2);
					var g_hex = string_copy(_str, 3, 2);
					var b_hex = string_copy(_str, 5, 2);
					_str=b_hex+g_hex+r_hex
					var _decimal = 0;
					for (var i = 0; i < 6; i++) {
					    var _char = string_char_at(_str, 6 - i);
					    var _digit = 0;
        
					    if (scr_stringtreal(_char)==1) {
					        _digit = real(_char);
					    } 
						else {
					        _digit = ord(_char) - 87;
					    }
        
					    _decimal += _digit * power(16, i);
					}
					for (var i=0;i<array_length(global.choose);i++){
						var _notetype=global.chartread[global.choose[i]][0];
							global.chartread[global.choose[i]][4]=_decimal;
					}
					scr_cancelchart();
				}
				/*}
				else{
					if (scr_stringtreal(_num)==1&&real(_num)>=0){
						for (var i=0;i<array_length(global.choose);i++){
							global.chartread[global.choose[i]][4]=round(real(_num));
						}
						scr_cancelchart();
					}
				}*/
			}
			else if(type==5){
				if (scr_stringtreal(_num)==1&&real(_num)>=0){
					if (global.chartread[global.choose[0]][0]=="L"||global.chartread[global.choose[0]][0]=="LN"){
						if (scr_stringtreal(_num)==1&&real(_num)>=0){
							for (var i=0;i<array_length(global.choose);i++){
								global.chartread[global.choose[i]][4]=round(real(_num));
							}
							scr_cancelchart();
						}
					}
					else{
						if(real(_num)>=0&&real(_num)<=3){
							for (var i=0;i<array_length(global.choose);i++){
								global.chartread[global.choose[i]][2]=round(real(_num));
							}
							scr_cancelchart();
						}
					}
					
				}
			}
        }
    }
}
