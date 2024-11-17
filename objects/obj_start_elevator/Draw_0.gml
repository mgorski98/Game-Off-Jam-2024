/// @description Insert description here
// You can write your code in this editor

if !elevator_disappeared {
	draw_self();

	var color = gold_quota_missing_color;
	if (self.current_gold_pieces >= self.target_gold_pieces) {
		color = gold_quota_met_color;
	}
	//todo: set a font here before draw
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_set_color(color);
	draw_text(x, y + self.status_text_y_offset, self.current_status_text);	
}

