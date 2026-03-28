
if (global.mouseonbtn==1) exit;
if !keyboard_check(vk_control) exit;

if (designview!=1) exit;
if(array_length(global.svchoose[1])==0) exit;

for(var _i=array_length(global.svchoose[1])-1;_i>=0;_i--){
	array_push(global.svchange[0][timinggroup],global.svchange[1][timinggroup][global.svchoose[1][_i]]);
}
array_sort(global.svchange[0][timinggroup],function(elm1, elm2){
	return real(elm1[0])-real(elm2[0]);
});