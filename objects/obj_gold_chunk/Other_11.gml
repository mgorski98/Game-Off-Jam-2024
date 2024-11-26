var _old = oPlayer.currently_picked_up

oPlayer.currently_picked_up = noone

_old.can_be_interacted_with = true;
_old.depth = DEFAULT_DEPTH
_old.phy_active = true;