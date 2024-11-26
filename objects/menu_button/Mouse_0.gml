
for (var i = 0; i < array_length(self.on_click); i += 1) {
	var f = array_get(self.on_click, i);
	f();
}