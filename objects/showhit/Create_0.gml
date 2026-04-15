if(x<600){
	instance_destroy(showdetail);
	instance_create_depth(580,0,-5000,showdetail);
}
else if(x>680){
	instance_destroy(showdetail);
	instance_create_depth(700,0,-5000,showdetail);
}
time=current_time+800;