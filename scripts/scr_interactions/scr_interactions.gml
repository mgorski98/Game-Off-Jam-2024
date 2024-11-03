function detect_closest_interactable(_player_x, _player_y, _range, _list_to_fill) {
	var _instances_count = collision_circle_list(_player_x, _player_y, _range, interactable, false, true, _list_to_fill, false);
	
	var _closest = noone
	var _min_dist = 100000000
	for (var i = 0; i < _instances_count; i += 1) {
		var _inst = ds_list_find_value(_list_to_fill, i);
		var _dist = point_distance(_player_x, _player_y, _inst.x, _inst.y);
		if (_dist <= _min_dist) {
			_closest = _inst;
			_min_dist = _dist;
		}
	}
	
	return _closest;
}
