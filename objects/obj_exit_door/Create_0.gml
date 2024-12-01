self.can_be_interacted_with = false;
gold_batches_required = irandom_range(min_gold_batches, max_gold_batches);
self.spawned_indicators = ds_list_create();

/*var s_width = sprite_get_width(self.door_indicator_sprite);
var total_width = indicator_spacing * (gold_batches_required - 1) + s_width * gold_batches_required;

var next_x = x - total_width/2 + s_width/2;
for (var i = 0; i < gold_batches_required; i += 1) {
	var obj = instance_create_layer(next_x, y+indicators_offset_y, "Instances", obj_door_indicator);
	ds_list_add(self.spawned_indicators, obj);
	
	next_x = next_x + s_width + indicator_spacing;
}*/

function on_gold_batch_sent() {
	current_gold_batches += 1;
	/*if self.current_gold_batches - 1 < ds_list_size(self.spawned_indicators) {
		var indicator = ds_list_find_value(self.spawned_indicators, self.current_gold_batches - 1);
		indicator.activate();
	}*/
	image_index = current_gold_batches;
	if current_gold_batches >= gold_batches_required and self.can_be_interacted_with == false {
		//open doors and make them interactable
		self.can_be_interacted_with = true;
		image_index = image_number -  1;
	}
}
