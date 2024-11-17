/// @description To powinno się odpalić zaraz po stworzeniu, przy inicjalizacji
// You can write your code in this editor
self.s_width = irandom_range(min_cutout_width, cutout_width);
self.s_height = irandom_range(min_cutout_height, cutout_height);
self.x_sprite_offset = irandom_range(0, self.tile_obj.sprite_width - self.s_width);
self.y_sprite_offset = irandom_range(0, self.tile_obj.sprite_height - self.s_height);