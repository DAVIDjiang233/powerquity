
if moding==1 {
	event_user(0);
}
if chartloading==1 {
	if (confirmt==1) confirmt=0;
	else chartloading=0;
}
if chartediting==1 {
	if (confirmt==1) confirmt=0;
	else chartediting=0;
}
else if(keyboard_check(ord("K"))&&keyboard_check(ord("L"))){
	show_debug_log(true)
}