depth=-9999;
surface = surface_create(room_width, room_height);
time_uniform = shader_get_uniform(Shader_mirror,"iTime");
resolution_uniform = shader_get_uniform(Shader_mirror,"iResolution");
frame_uniform = shader_get_uniform(Shader_mirror,"iFrame");
