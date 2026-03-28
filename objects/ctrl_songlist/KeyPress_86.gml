if array_length(global.filelist)==0 {
	msg = get_integer_async("曲名", "");
}
if moding==1 exit;
if chartloading==1 exit;
if array_length(global.filelist)==0 exit;
if chartrue==0 exit;
if chartediting==0 {
	modtype=0;
	chartediting=1;
}
else {
	chartediting=0;
}
