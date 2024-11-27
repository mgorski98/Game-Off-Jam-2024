if self.marked_mineable {
	image_blend = mineable_overlay_tint;
} else {
	image_blend = c_white;
}

draw_self();
if contains_gold && self.gold_overlay_sprite != undefined {
	//narysować teksturę złota
	draw_sprite(gold_overlay_sprite, -1, x, y);
}
if current_health != hit_durability {
	//narysować teksturę uszkodzeń
	var target_alpha = (hit_durability - current_health + 1) / hit_durability;
	var old_alpha = draw_get_alpha();
	var old_color = draw_get_color();
	draw_set_alpha(target_alpha);
	draw_set_color(mineable_overlay_tint);
	draw_sprite(self.destruction_overlay_sprite, 0, x, y);
	draw_set_alpha(old_alpha);
	draw_set_color(old_color);
}