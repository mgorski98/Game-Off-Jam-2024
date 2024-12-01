if !elevator_disappeared {
	//separate event so it always draws on top
	var color = gold_quota_missing_color;
	if (self.current_gold_pieces >= self.target_gold_pieces) {
		color = gold_quota_met_color;
	}
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_set_color(color);
	var old_font = draw_get_font();
	draw_set_font(fnt_elevator_font);
	draw_text(x, y + self.status_text_y_offset, self.current_status_text);	
	draw_set_font(old_font);
}