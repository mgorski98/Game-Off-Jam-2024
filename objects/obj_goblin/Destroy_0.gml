/// @description Insert description here
// You can write your code in this editor

if self.spawner_ref != noone && instance_exists(self.spawner_ref) {
	self.spawner_ref.current_goblins -= 1;
}