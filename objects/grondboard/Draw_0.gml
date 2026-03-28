if keyboard_check(global.pressreal[boardtype]){
	if global.pressreal[boardtype]==ord("1") image_blend = #ff6666;
	if global.pressreal[boardtype]==ord("2") image_blend = #ff9966;
	if global.pressreal[boardtype]==ord("3") image_blend = #66cc66;
	if global.pressreal[boardtype]==ord("4") image_blend = #6666ff;
}
else{
	if global.pressreal[boardtype]==ord("1") image_blend = #ff3333;
	if global.pressreal[boardtype]==ord("2") image_blend = #ff7733;
	if global.pressreal[boardtype]==ord("3") image_blend = #33aa33;
	if global.pressreal[boardtype]==ord("4") image_blend = #3333ff;
}

draw_self();
image_blend = #ffffff;