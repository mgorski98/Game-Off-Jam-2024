event_inherited()

var _old = oPlayer.currently_picked_up

if (_old != noone){
	//dropnąć item
	oPlayer.currently_picked_up = noone;
	//przywrócić stare wartości, jak np. fizyka, etc.
	_old.can_be_interacted_with = true;
	_old.depth = DEFAULT_DEPTH;
	_old.phy_active = true;
}

can_be_interacted_with = false;
oPlayer.currently_picked_up = self
self.depth = HELD_ITEM_DRAW_DEPTH;
//todo: wyłączyć fizykę itd.
self.phy_active = false;