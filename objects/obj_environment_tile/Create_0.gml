current_health = hit_durability;
auto_tile(self);

function spawn_debris(contact_x, contact_y) {
	var amount = irandom_range(min_debris_chunks, max_debris_chunks);
	var dir = point_direction(contact_x, contact_y, oPlayer.x, oPlayer.y);
	for (var i = 0; i < amount; i += 1) {
		var obj = instance_create_layer(contact_x, contact_y, "Instances", obj_tile_debris);
		obj.source_tile_sprite = sprite_index;
		obj.source_tile_sprite_image_index = image_index;
		obj.tile_obj = self;
		var spread = self.debris_fly_spread;
		var force = self.debris_fly_force;
		with (obj) {
			event_user(0);
			var angle_variation = random_range(-spread, spread);
			var xforce = lengthdir_x(force, dir + angle_variation);
			var yforce = lengthdir_y(force, dir + angle_variation);
			physics_apply_force(x, y, xforce, yforce);
		}
	}
}