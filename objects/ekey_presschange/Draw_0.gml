var _zwrite = gpu_get_zwriteenable();
var _ztest = gpu_get_ztestenable();
gpu_set_zwriteenable(true);
gpu_set_ztestenable(true);
var _depth = gpu_get_depth();

gpu_set_depth(_depth);
if changebar=="1" draw_set_colour(#440000);
if changebar=="2" draw_set_colour(#442200);
if changebar=="3" draw_set_colour(#003300);
if changebar=="4" draw_set_colour(#000044);
draw_rectangle(x-(global.playskin[65]/2),-1,x+(global.playskin[65]/2)-1,608-power(endtime-global.playtime,3)/19000000,false);

draw_set_alpha((endtime-global.playtime)/4000)
if changebar=="1" draw_set_colour(#ff0000);
if changebar=="2" draw_set_colour(#ff9900);
if changebar=="3" draw_set_colour(#00cc00);
if changebar=="4" draw_set_colour(#0000ff);
draw_rectangle(x-(global.playskin[65]/2),-1,x-(global.playskin[65]/2)+6,608-power(endtime-global.playtime,3)/19000000,false);
draw_rectangle(x+(global.playskin[65]/2)-7,-1,x+(global.playskin[65]/2)-1,608-power(endtime-global.playtime,3)/19000000,false);
draw_set_alpha(1)

gpu_set_depth(-400);

if changebar=="1" draw_set_colour(#ff0000);
if changebar=="2" draw_set_colour(#ffff00);
if changebar=="3" draw_set_colour(#00ff00);
if changebar=="4" draw_set_colour(#0000ff);
draw_rectangle(x-(global.playskin[65]/2),y-12,x+(global.playskin[65]/2)-1,y,false);

//draw_text(x, y-10, string(keyamo));
gpu_set_depth(_depth);
gpu_set_zwriteenable(_zwrite);
gpu_set_ztestenable(_ztest);