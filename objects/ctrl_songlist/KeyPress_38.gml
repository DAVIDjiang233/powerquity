if confirmt==1 exit;
if moding==1{
	if modtype>0 modtype--;
}
else if chartloading==1{
	if modtype>0 modtype--;
}
else if chartediting==1{
	if modtype>0 modtype--;
}
else{
	if array_length(global.filelist)==0 exit;
	if global.chart==0 exit;
	global.chart--;
	global.level=0;
	readfile();
}