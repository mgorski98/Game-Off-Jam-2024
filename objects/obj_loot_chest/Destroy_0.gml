/// @description Insert description here
// You can write your code in this editor
if self.open_particles != noone {
	for (var i = 0; i < ds_list_size(self.open_particles); i += 1) {
		var system_ref = ds_list_find_value(self.open_particles, i);
		if part_system_exists(system_ref) {
			part_system_destroy(system_ref);
		}
	}
	ds_list_clear(self.open_particles);
}