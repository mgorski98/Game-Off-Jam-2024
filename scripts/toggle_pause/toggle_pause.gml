global.paused = false;
global.pause_surface = -1;
global.pause_surface_buffer = -1;

function toggle_pause(){
	var _old = global.paused;
	
	global.paused = not global.paused;
	if (global.paused){
		var _window_width, _window_height;
		_window_height = display_get_height();
		_window_width = display_get_width();
		//tworzymy powierzchnię, i rysujemy na niej obecną zawartość ekranu
		global.pause_surface = surface_create(_window_width, _window_height);
		surface_set_target(global.pause_surface);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
		//to jest do backupu, bo w przeciwnym wypadku jak zminimalizuje się grę to ta powierzchnia od pauzy może przestać istnieć
		global.pause_surface_buffer = buffer_create(_window_width * _window_height * 4, buffer_fixed, 1);
		buffer_get_surface(global.pause_surface_buffer, global.pause_surface, 0);
		instance_deactivate_all(false);
	}
	else {
		instance_activate_all();
		if surface_exists(global.pause_surface) {
			surface_free(global.pause_surface);
		}
		if buffer_exists(global.pause_surface_buffer) {
			buffer_delete(global.pause_surface_buffer);
		}
	}
	instance_activate_object(obj_pause_controller);
}