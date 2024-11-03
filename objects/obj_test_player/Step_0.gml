
var _interactable = detect_closest_interactable(x, y, interactable_check_range)
if (_interactable != noone) {
	show_debug_message("DETECTED!!!!")
} else  {
	show_debug_message("NON DETECTED!!!")
}