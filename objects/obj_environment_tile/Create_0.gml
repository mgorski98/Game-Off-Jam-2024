current_health = hit_durability;
auto_tile(self);

function spawn_debris(contact_x, contact_y/*, normal_x, normal_y*/) {
	//show_debug_message(string("normals: {0} {1}", normal_x, normal_y));
	var amount = irandom_range(min_debris_chunks, max_debris_chunks);
	var dir = point_direction(contact_x, contact_y, oPlayer.x, oPlayer.y);
	for (var i = 0; i < amount; i += 1) {
		var obj = instance_create_layer(contact_x, contact_y, "Instances", obj_tile_debris);
		obj.source_tile_sprite = sprite_index;
		obj.source_tile_sprite_image_index = image_index;
		obj.tile_obj = self;
		var spread = debris_fly_spread_degrees;
		var force = self.debris_fly_force + random_range(-debris_fly_force_variance, debris_fly_force_variance);
		with (obj) {
			event_user(0);
			//dodać siłę w kierunku gracza
			var actual_dir = dir + random_range(-spread, spread);
			var xforce = lengthdir_x(force, actual_dir);
			var yforce = lengthdir_y(force, actual_dir);
			physics_apply_force(x, y, xforce, yforce);
			//physics_apply_force(x, y, normal_x * force, normal_y * force);
		}
	}
}