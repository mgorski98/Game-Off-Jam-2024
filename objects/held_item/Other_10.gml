event_inherited()

var _old = obj_test_player.currently_picked_up

if (_old != noone){
	//dropnąć item
	obj_test_player.currently_picked_up = noone;
	//przywrócić stare wartości, jak np. fizyka, etc.
	_old.can_be_interacted_with = true;
	_old.depth = DEFAULT_DEPTH;
}

can_be_interacted_with = false;
obj_test_player.currently_picked_up = self
self.depth = HELD_ITEM_DRAW_DEPTH;
//todo: wyłączyć fizykę itd.