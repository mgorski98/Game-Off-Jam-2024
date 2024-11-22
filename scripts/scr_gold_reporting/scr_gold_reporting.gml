// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function gold_spawned(gold_instance){
	var spawner = obj_goblin_spawner;
	if spawner.spawns_queue == noone {
		spawner.spawns_queue = ds_list_create();
	}
	
	ds_list_add(spawner.spawns_queue, {
		gold_x : gold_instance.x,
		gold_y : gold_instance.y,
		timer : random_range(spawner.spawn_interval - spawner.spawn_interval_variance, spawner.spawn_interval + spawner.spawn_interval_variance),
		gold_obj : gold_instance
	});
}