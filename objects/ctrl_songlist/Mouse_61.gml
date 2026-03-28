if confirmt==1 exit;
if moding==1{
	if modtype<5 modtype++;
}
else if chartloading==1{
	if modtype<6 modtype++;
}
else if chartediting==1{
	if modtype<4 modtype++;
}
else{

if array_length(global.fileread)==0 exit;
if global.chart==array_length(global.filelist)-1 exit;

global.chart++;
global.level=0;
readfile();

}