/// @description Insert description here
// You can write your code in this editor
var to_spawn = obj_gold_chunk;
if self.has_golden_idol {
	to_spawn = obj_gold_idol;
}
var gold = instance_create_layer(x, y, "Instances", to_spawn);
var fly_force = self.gold_appear_fly_force;
var angel = self.spawn_max_fly_angle;
with (gold) {
	var force = fly_force;
	var spawn_angle_x = random_range(90 - angel, 90 + angel);
	var forcex = lengthdir_x(force, spawn_angle_x);
	var forcey = lengthdir_y(force, spawn_angle_x);
	physics_apply_force(x, y, forcex, forcey);
}

self.current_spawns += 1;
if self.current_spawns < self.stored_chunks {
	alarm[0] = spawn_interval * game_get_speed(gamespeed_fps);
}

var system = part_system_create(ps_open_chest);
ds_list_add(self.open_particles, system);
part_system_position(system,x,y);