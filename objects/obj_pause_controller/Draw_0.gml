/// @description Insert description here
// You can write your code in this editor
if (global.paused){
	if surface_exists(global.pause_surface) {
		surface_set_target(application_surface);
		draw_surface(global.pause_surface, 0, 0);
		surface_reset_target();
	}
	else {
		global.pause_surface = surface_create(display_get_width(), display_get_height());
		buffer_set_surface(global.pause_surface_buffer, global.pause_surface, 0);
	}
}