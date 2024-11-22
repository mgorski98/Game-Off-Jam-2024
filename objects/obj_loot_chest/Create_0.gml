/// @description Insert description here
// You can write your code in this editor
self.stored_chunks = irandom_range(1, self.max_gold_chunks);
self.has_golden_idol = random_range(0.0, 1.0) <= self.gold_idol_chance;
if self.has_golden_idol {
	self.stored_chunks = 1;
}
self.current_spawns = 0;