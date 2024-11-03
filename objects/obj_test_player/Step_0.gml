ds_list_clear(interactables_list)
var _interactable = detect_closest_interactable(x, y, interactable_check_range, interactables_list)

current_interactable = _interactable

var _show_prompt = false;

if (current_interactable != noone && currently_picked_up == noone) {
	_show_prompt = true;	
}

if (interaction_prompt != noone) {
	if (_show_prompt) {
		instance_activate_object(interaction_prompt);
	}else {
		instance_deactivate_object(interaction_prompt);
	}
	if (current_interactable != noone) {
		interaction_prompt.x = current_interactable.x;
		var _new_y =  current_interactable.y - current_interactable.sprite_height / 2
		interaction_prompt.y = _new_y - interaction_prompt.y_offset_from_top;
	}
}

if (keyboard_check_pressed(ord("E"))) {
	//try interacting - picking up the item, etc.
	show_debug_message("Interaction started");
	if (current_interactable != noone and current_interactable.can_be_interacted_with) {
		show_debug_message("picked up an item!");
		with (current_interactable){
			event_user(0);
		}
	}
}

if (keyboard_check_pressed(ord("Q"))) {
	//upuścić item
	if (currently_picked_up != noone){
		with (currently_picked_up){
			event_user(1);
		}
	}
}

if (currently_picked_up != noone) {
	//todo: to poprawić, jak dojdzie flipowanie sprite'a - wtedy przemnożyć razy 1 albo -1
	currently_picked_up.x = x + picked_up_item_x_offset;
	currently_picked_up.y = y + picked_up_item_y_offset;
}

if (keyboard_check(vk_left) or keyboard_check(ord("A"))){
	x += -1;
}

if (keyboard_check(vk_right) or keyboard_check(ord("D"))){ x+=1; }