/// @description Insert description here
// You can write your code in this editor
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
self.phy_active = false;