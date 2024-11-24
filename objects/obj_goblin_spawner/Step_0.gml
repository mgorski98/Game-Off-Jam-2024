/// @description Insert description here
// You can write your code in this editor
var dt = delta_time / 1000000;

for (var i = 0; i < ds_list_size(self.spawns_queue); i +=1) {
	var data = ds_list_find_value(self.spawns_queue, i);
	data.timer -= dt;
	if !instance_exists(data.gold_obj) {
		ds_list_delete(self.spawns_queue, i);
		i -= 1;
		spawn_goblin(data.gold_x, data.gold_y);
		continue;
	}
	if data.timer <= 0 {
		ds_list_delete(self.spawns_queue, i);
		i -= 1;
	} else {
		ds_list_set(self.spawns_queue, i, data);
	}
}