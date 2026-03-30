if (!surface_exists(surface)) surface = surface_create(room_width, room_height);
surface_set_target(surface);
draw_clear_alpha(c_black, 0);
shader_set(Shader_bloom);
var powers = shader_get_uniform(Shader_bloom, "powers");
var roomx = shader_get_uniform(Shader_bloom, "roomx");
var roomy = shader_get_uniform(Shader_bloom, "roomy");
shader_set_uniform_f(powers,global.bloom[0]);
shader_set_uniform_f(roomx,1280);
shader_set_uniform_f(roomy,736);

draw_surface(application_surface, 0, 0);
shader_reset();
surface_reset_target();
draw_surface(surface, 0, 0);
