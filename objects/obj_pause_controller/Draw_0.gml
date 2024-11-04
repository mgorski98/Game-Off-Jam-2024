/// @description Insert description here
// You can write your code in this editor
if (global.paused and surface_exists(global.pause_surface)){
	surface_set_target(application_surface);
	draw_surface(global.pause_surface, 0, 0);
	surface_reset_target();
}