event_inherited();
if oPlayer.currently_picked_up != noone {
	var gold = oPlayer.currently_picked_up;
	current_gold_pieces += 1;
	oPlayer.currently_picked_up = noone;
	instance_destroy(gold);
}
//jak gracz nie ma golda, to ustaw flagę can_be_interacted_with na false
self.current_status_text = string("{0}/{1}", current_gold_pieces, target_gold_pieces);
//todo: update the stored gold sprite
if current_gold_pieces >= target_gold_pieces {
	obj_start_elevator_control_lever.can_be_interacted_with = true;
	quota_was_fulfilled = true;
}