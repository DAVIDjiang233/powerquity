if chartloading==1 exit;
if chartediting==1 exit;
if array_length(global.filelist)==0 exit;
if moding==0 {
	modtype=0;
	moding=1;
}
else {
	event_user(0);
}