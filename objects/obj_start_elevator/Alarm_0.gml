/// @description Insert description here
// You can write your code in this editor

obj_exit_door.on_gold_batch_sent();
self.current_gold_pieces = 0;
target_gold_pieces = irandom_range(self.min_gold_pieces, self.max_gold_pieces);
self.current_status_text = string("{0}/{1}", current_gold_pieces, target_gold_pieces);
elevator_disappeared = false;
activate_elevator(-self.elevator_direction);