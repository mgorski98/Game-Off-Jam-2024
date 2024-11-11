/// @description Insert description here
// You can write your code in this editor
enum EnemyState {
	wandering =0,
	idle = 1,
	following_target=2,
	running_away=3,
	attacking = 4
}

self.target = noone;
self.state = EnemyState.wandering;

self.wander_target_choose_timer = random_range(self.wander_timer_min, self.wander_timer_max);
self.attack_timer = -1.0;
self.idle_timer = -1.0;
self.current_direction = 1;

self.vsp = 0
self.hsp = 0
self.grv = 0.2

image_xscale = self.current_direction;
image_blend = c_red;