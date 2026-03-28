if (!surface_exists(surface)) surface = surface_create(room_width, room_height);
surface_set_target(surface);
draw_clear_alpha(c_black, 0);
shader_set(Shader3);
var powers = shader_get_uniform(Shader3, "powers");
var colorb = shader_get_uniform(Shader3, "colorb");
shader_set_uniform_f(powers,global.chromatic[0]);
shader_set_uniform_f(colorb,global.chromatic[1]);

draw_surface(application_surface, 0, 0);
shader_reset();
surface_reset_target();
draw_surface(surface, 0, 0);
