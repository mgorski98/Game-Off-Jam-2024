
var _color = normal_color

if (pressed){
	_color = click_color
} else if (hovered_over){
	_color = hover_color
}

image_blend = _color
draw_self()

draw_set_color(c_black)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
var old_font = draw_get_font();
if self.font != noone {
	draw_set_font(self.font);
}
draw_text(x, y, button_text)
draw_set_font(old_font);