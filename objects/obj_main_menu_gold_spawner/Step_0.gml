/// @description Insert description here
// You can write your code in this editor
if timer > 0 {
	timer -= delta_time / 1000000;
} else {
	timer = interval;
	var _x = random_range(50, room_width - 50);
	instance_create_layer(_x, 0, "Instances", obj_gold_chunk);
}