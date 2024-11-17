/// @description Insert description here
// You can write your code in this editor
alarm[0] = disappear_time * game_get_speed(gamespeed_fps);

self.x_sprite_offset = irandom_range(0, self.tile_obj.sprite_width - self.cutout_width);
self.y_sprite_offset = irandom_range(0, self.tile_obj.sprite_height - cutout_height);