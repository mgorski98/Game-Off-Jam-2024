draw_self()

var _vertical_align
var _horizontal_align

switch (halign) {
	case "center":
		_horizontal_align = fa_center
		break;
	case "left":
		_horizontal_align = fa_left
		break;
	case "right":
		_horizontal_align = fa_right
		break;
}

switch (valign) {
	case "center":
		_vertical_align = fa_middle
		break;
	case "top":
		_vertical_align = fa_top
		break;
	case "bottom":
		_vertical_align = fa_bottom
		break;
}

draw_set_halign(_horizontal_align)
draw_set_valign(_vertical_align)
draw_set_color(text_color)
draw_text(x,y,text)
