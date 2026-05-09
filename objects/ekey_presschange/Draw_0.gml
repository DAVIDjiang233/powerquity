var _zwrite = gpu_get_zwriteenable();
var _ztest = gpu_get_ztestenable();
gpu_set_zwriteenable(true);
gpu_set_ztestenable(true);
var _depth = gpu_get_depth();

gpu_set_depth(_depth);
if changebar=="1" draw_set_colour(global.skinnumber[11]);
if changebar=="2" draw_set_colour(global.skinnumber[12]);
if changebar=="3" draw_set_colour(global.skinnumber[13]);
if changebar=="4" draw_set_colour(global.skinnumber[14]);
draw_rectangle(x-(global.skinnumber[0]/2),-1,x+(global.skinnumber[0]/2)-1,global.skinnumber[2]-power(endtime-global.playtime,3)/19000000,false);

draw_set_alpha((endtime-global.playtime)/4000)
if changebar=="1" draw_set_colour(global.skinnumber[15]);
if changebar=="2" draw_set_colour(global.skinnumber[16]);
if changebar=="3" draw_set_colour(global.skinnumber[17]);
if changebar=="4" draw_set_colour(global.skinnumber[18]);
draw_rectangle(x-(global.skinnumber[0]/2),-1,x-(global.skinnumber[0]/2)+6,global.skinnumber[2]-power(endtime-global.playtime,3)/19000000,false);
draw_rectangle(x+(global.skinnumber[0]/2)-7,-1,x+(global.skinnumber[0]/2)-1,global.skinnumber[2]-power(endtime-global.playtime,3)/19000000,false);
draw_set_alpha(1)

gpu_set_depth(-1000);




if changebar=="1" draw_sprite_ext(global.playskin[87+(key1*4)+real(changebar)],0,x,y,1,1,0,global.skinnumber[19],1);
if changebar=="2" draw_sprite_ext(global.playskin[87+(key1*4)+real(changebar)],0,x,y,1,1,0,global.skinnumber[20],1);
if changebar=="3" draw_sprite_ext(global.playskin[87+(key1*4)+real(changebar)],0,x,y,1,1,0,global.skinnumber[21],1);
if changebar=="4" draw_sprite_ext(global.playskin[87+(key1*4)+real(changebar)],0,x,y,1,1,0,global.skinnumber[22],1);

//draw_text(x, y-10, string(keyamo));
gpu_set_depth(_depth);
gpu_set_zwriteenable(_zwrite);
gpu_set_ztestenable(_ztest);