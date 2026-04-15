var _zwrite = gpu_get_zwriteenable();
var _ztest = gpu_get_ztestenable();
gpu_set_zwriteenable(true);
gpu_set_ztestenable(true);
var _depth = gpu_get_depth();

gpu_set_depth(_depth);
if changebar=="1" draw_set_colour(global.playskin[80]);
if changebar=="2" draw_set_colour(global.playskin[81]);
if changebar=="3" draw_set_colour(global.playskin[82]);
if changebar=="4" draw_set_colour(global.playskin[83]);
draw_rectangle(x-(global.playskin[69]/2),-1,x+(global.playskin[69]/2)-1,global.playskin[71]-power(endtime-global.playtime,3)/19000000,false);

draw_set_alpha((endtime-global.playtime)/4000)
if changebar=="1" draw_set_colour(global.playskin[84]);
if changebar=="2" draw_set_colour(global.playskin[85]);
if changebar=="3" draw_set_colour(global.playskin[86]);
if changebar=="4" draw_set_colour(global.playskin[87]);
draw_rectangle(x-(global.playskin[69]/2),-1,x-(global.playskin[69]/2)+6,global.playskin[71]-power(endtime-global.playtime,3)/19000000,false);
draw_rectangle(x+(global.playskin[69]/2)-7,-1,x+(global.playskin[69]/2)-1,global.playskin[71]-power(endtime-global.playtime,3)/19000000,false);
draw_set_alpha(1)

gpu_set_depth(-1000);




if changebar=="1" draw_sprite_ext(global.playskin[87+(key1*4)+real(changebar)],0,x,y,1,1,0,global.playskin[88],1);
if changebar=="2" draw_sprite_ext(global.playskin[87+(key1*4)+real(changebar)],0,x,y,1,1,0,global.playskin[89],1);
if changebar=="3" draw_sprite_ext(global.playskin[87+(key1*4)+real(changebar)],0,x,y,1,1,0,global.playskin[90],1);
if changebar=="4" draw_sprite_ext(global.playskin[87+(key1*4)+real(changebar)],0,x,y,1,1,0,global.playskin[91],1);

//draw_text(x, y-10, string(keyamo));
gpu_set_depth(_depth);
gpu_set_zwriteenable(_zwrite);
gpu_set_ztestenable(_ztest);