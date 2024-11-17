//todo: implement auto-tiling here
current_health = hit_durability;
auto_tile(self);

function spawn_debris(contact_x, contact_y, is_up = true) {
	var amount = irandom_range(min_debris_chunks, max_debris_chunks);
	var dir;
	if is_up {
		dir = -1;
	} else {
		dir = 1;
	}
	for (var i = 0; i < amount; i += 1) {
		var obj = instance_create_layer(contact_x, contact_y, "Instances", obj_tile_debris);
		obj.source_tile_sprite = sprite_index;
		obj.source_tile_sprite_image_index = image_index;
		obj.tile_obj = self;
		obj.speed = random_range(debris_fly_force - 1.5, debris_fly_force + 1.5);
		obj.direction = random_range(45, 135) * dir;
		obj.gravity = 0.1;
		obj.gravity_direction = 270;
	}
}