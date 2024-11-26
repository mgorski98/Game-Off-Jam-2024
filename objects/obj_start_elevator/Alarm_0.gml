/// @description Insert description here
// You can write your code in this editor


var total = self.current_gold_pieces;
var quota = target_gold_pieces;

show_debug_message(string("Got a total of {0} gold, with quota: {1}", total, quota));

while total >= quota {
	var diff = total - quota;
	total = diff;
	show_debug_message(string("Removed {0} from quota. New total: {1}", quota, total));
	quota = irandom_range(self.min_gold_pieces, self.max_gold_pieces);
	show_debug_message(string("New quota: {0}", quota));
	obj_exit_door.on_gold_batch_sent();
} 

self.current_gold_pieces = total;
self.target_gold_pieces = quota;

self.current_status_text = string("{0}/{1}", current_gold_pieces, target_gold_pieces);
elevator_disappeared = false;
activate_elevator(-self.elevator_direction);