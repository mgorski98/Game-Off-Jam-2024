/// @description Insert description here
// You can write your code in this editor
if (mouse_check_button_pressed(0)) {
	var mx = mouse_x;
	var my = mouse_y;
	
	show_debug_message("HI THERE");
	var layer_id = layer_get_id("Tiles_1");
	var map_id = layer_tilemap_get_id(layer_id);
	var data = tilemap_get_at_pixel(map_id, mx, my);
	if data != noone {
		tile_set_empty(data);
		tilemap_set_at_pixel(layer_id, 0, mx, my);
	}
}