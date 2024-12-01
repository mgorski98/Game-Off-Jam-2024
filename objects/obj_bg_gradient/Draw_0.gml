/// @description Background gradient

// Available "built-in" colors:
// c_aqua, c_black, c_blue, c_dkgray, c_fuchsia, c_gray, c_green, c_lime, c_ltgray,
// c_maroon, c_navy, c_olive, c_purple, c_red, c_silver, c_teal, c_white, c_yellow

// Square gradient colors
var top_left_color = top_color;
var bottom_left_color = bottom_color;
var top_right_color = top_color;
var bottom_right_color = bottom_color;

draw_rectangle_color(0,0,room_width,room_height,top_left_color,top_right_color,bottom_right_color,bottom_left_color,0);
