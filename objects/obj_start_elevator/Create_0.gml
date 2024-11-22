/// @description Insert description here
// You can write your code in this editor

function activate_elevator(go_direction) {
	self.elevator_direction = go_direction;
	self.elevator_going_timer = self.elevator_move_time;
	self.elevator_going = true;
	self.can_be_interacted_with = false;
}


target_gold_pieces = irandom_range(self.min_gold_pieces, self.max_gold_pieces);
self.current_status_text = string("{0}/{1}", current_gold_pieces, target_gold_pieces);

self.elevator_direction = 1;
self.elevator_going_timer = self.elevator_move_time;