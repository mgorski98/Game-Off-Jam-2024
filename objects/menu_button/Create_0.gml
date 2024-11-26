/// @description Insert description here
// You can write your code in this editor

self.on_click = array_create(0);

function subscribe(func) {
	array_insert(self.on_click, array_length(self.on_click), func);
}
