/// @description Insert description here
// You can write your code in this editor
//spawner as a parameter because it doesn't fucking work otherwise
//self.spawns_queue = ds_list_create();

self.spawn_timer = self.spawn_interval;

function spawn_goblin(spawn_x, spawn_y) {
	if current_goblins >= self.goblin_spawn_limit{
		return;
	}
	//current goblins is being incremented in the create/destroy events of a goblin
	var hit_tile = collision_line(spawn_x, spawn_y, spawn_x, spawn_y + 10000, oCollision, false, true);
	if hit_tile != noone {
		var offset = hit_tile.sprite_height / 2;
		var new_x = spawn_x;
		var new_y = hit_tile.y - offset;
		instance_create_layer(new_x, new_y, "Instances", obj_goblin);
	}
}