/// @description Insert description here
// You can write your code in this editor

var _dt = delta_time / 1000000;

if self.elevator_going {
	if self.elevator_going_timer > 0 {
		self.elevator_going_timer -= _dt;
		self.y += self.elevator_direction * self.elevator_speed;
	} else {
		self.elevator_going = false;
		self.can_be_interacted_with = true;
		if self.elevator_direction < 0 {
			//winda jedzie do góry - niech zniknie na ~x sekund a potem wróci i zjedzie
			alarm[0] = elevator_disappear_time * game_get_speed(gamespeed_fps);
			elevator_disappeared = true;
			
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
		}
	}
}

self.can_be_interacted_with = not self.elevator_going and oPlayer.currently_picked_up != noone;
