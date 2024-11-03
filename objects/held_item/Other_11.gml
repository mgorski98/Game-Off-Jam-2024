var _old = obj_test_player.currently_picked_up

obj_test_player.currently_picked_up = noone
//todo: włączyć z powrotem fizykę i inne takie

_old.can_be_interacted_with = true;
_old.depth = DEFAULT_DEPTH