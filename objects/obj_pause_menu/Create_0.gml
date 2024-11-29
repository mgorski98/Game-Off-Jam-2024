/// @description Insert description here
// You can write your code in this editor

self.title = instance_create_layer(x, y - 62, "Menus", ui_text);
self.title.text = "Paused";
self.resume_button = instance_create_layer(x, y, "Menus", menu_button);
self.resume_button.subscribe(function() {
	toggle_pause();
});
self.resume_button.button_text = "Resume";
self.back_to_menu_button = instance_create_layer(x,y,"Menus",menu_button);
self.back_to_menu_button.subscribe(function(){
	room_goto(rm_main_menu);
});
self.back_to_menu_button.button_text = "To main menu";
self.exit_button = instance_create_layer(x,y,"Menus",menu_button);
self.exit_button.button_text = "To desktop";
self.exit_button.subscribe(function() {
	game_end(0);
})

var mult = 1.75;
self.resume_button.image_xscale *= mult;
self.resume_button.image_yscale *= mult;

self.back_to_menu_button.image_xscale *= mult;
self.back_to_menu_button.image_yscale *= mult;

self.exit_button.image_xscale *= mult;
self.exit_button.image_yscale *= mult;

var start_y = y - 25 + child_spacing;

self.resume_button.y = start_y;
start_y += self.resume_button.sprite_height + child_spacing;
self.back_to_menu_button.y = start_y;
start_y += self.back_to_menu_button.sprite_height + child_spacing;
self.exit_button.y = start_y;