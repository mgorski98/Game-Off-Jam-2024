function detect_closest_interactable(_player_x, _player_y, _range) {
	var _instance = instance_nearest(_player_x, _player_y, interactable)
	if (_instance == noone) {
		return noone;
	}
	
	var _dist = point_distance(_player_x, _player_y, _instance.x, _instance.y)
	show_debug_message( string_concat("DISTANCE: ", _dist, ", MAX: ", _range))
	if (_dist > _range) {
		return noone;
	} 
	
	return _instance;
}

