if (!surface_exists(surface)) surface = surface_create(room_width, room_height);
surface_set_target(surface);
draw_clear_alpha(c_black, 0);
shader_set(Shader_mirror);

draw_surface(application_surface, 0, 0);
shader_reset();
surface_reset_target();
draw_surface(surface, 0, 0);
