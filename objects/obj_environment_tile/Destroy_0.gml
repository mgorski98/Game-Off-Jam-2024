if contains_gold {
	var _gold_chunk = instance_create_layer(x, y, "Instances", obj_gold_chunk)
}
//ze zmienną na wypadek jakiejś tam inicjalizacji
update_auto_tiling_for_surrounding_tiles(self);