/// @description Insert description here
// You can write your code in this editor

self.on_click = array_create(array_length(self.on_click_editor_only));
for (var i = 0; i < array_length(self.on_click_editor_only); i += 1) {
	self.on_click[i] = self.on_click_editor_only[i];
}

function subscribe(func) {
	array_insert(self.on_click, array_length(self.on_click), func);
}
