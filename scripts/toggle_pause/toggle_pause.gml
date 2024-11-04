global.paused = false;
global.pause_surface = -1;

function toggle_pause(){
	var _old = global.paused;
	
	global.paused = not global.paused;
	if (global.paused){
		global.pause_surface = surface_create(window_get_width(), window_get_height());
		surface_set_target(global.pause_surface);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
		
		instance_deactivate_all(false);
	}
	else {
		instance_activate_all();
		if surface_exists(global.pause_surface) {
			surface_free(global.pause_surface);
		}
	}
	instance_activate_object(obj_pause_controller);
}