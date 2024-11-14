ds_list_clear(interactables_list)
var _interactable = detect_closest_interactable(x, y, interactable_check_range, interactables_list)

current_interactable = _interactable

var _show_prompt = false;

if (current_interactable != noone && currently_picked_up == noone) {
	_show_prompt = true;	
}

if (interaction_prompt != noone) {
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
	currently_picked_up.phy_position_x = x + picked_up_item_x_offset;
	currently_picked_up.phy_position_y = y + picked_up_item_y_offset;
}

if (keyboard_check(vk_left) or keyboard_check(ord("A"))){
	x += -1;
}

if (keyboard_check(vk_right) or keyboard_check(ord("D"))){ x+=1; }

if (keyboard_check(vk_up) or keyboard_check(ord("W"))) { y -= 1; }
if (keyboard_check(vk_down) or keyboard_check(ord("S"))) { y += 1; }

if (mouse_check_button_pressed(mb_left) and self.currently_picked_up != noone) {
	var picked = self.currently_picked_up;
	var throw_dir =  point_direction(x, y, mouse_x, mouse_y);
	var force_mul = self.throw_force;
	picked.phy_active = true;
	//todo: ogarnąć jak poprawnie policzyć ten zasrany kierunek i zaaplikować siłę
	with (picked){
		var force_x = lengthdir_x(force_mul, throw_dir);
		var force_y = lengthdir_y(force_mul, throw_dir);
		physics_apply_force(picked.x, picked.y, force_x, force_y);
	}
	picked.can_be_interacted_with = true;
	picked.can_be_picked_up = true;
	picked.is_held = false;
	self.currently_picked_up = noone;
}