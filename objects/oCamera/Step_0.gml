/// @description Update camera

// Update destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

// Update object position
x += (xTo - x) / 25
y += (yTo - y) / 25

x = clamp(x, view_w_half + buff, room_width  - view_w_half - buff); // buff is used for camera offset; when camera shakes it moves beyond the level grid, which results in seeing area beyond level. Offsetting camera by buff stops it from happening (https://youtu.be/r9OYXCUydGg?si=fuKbxKwnIQ20-Ky6&t=408)
y = clamp(y, view_h_half + buff, room_height - view_h_half - buff);

// Screen shake
x += random_range(-shake_remain, shake_remain)
y += random_range(-shake_remain, shake_remain)

shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));

// Update camera view
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

