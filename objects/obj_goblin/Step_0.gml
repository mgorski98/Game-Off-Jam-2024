function drop_held_gold() {
	if !(self.held_gold_object != noone && instance_exists(self.held_gold_object)) {
		return;
	}
	
	change_state(EnemyState.running_away);
	var gold = self.held_gold_object;
	self.held_gold_object = noone;
	can_pick_up_gold = false;
	gold.can_be_interacted_with = true;
	gold.phy_active = true;
	alarm[1] = game_get_speed(gamespeed_fps) * hit_run_away_timer;
}

function detect_gold_around() {
	var count = collision_circle_list(x, y, self.gold_sniffing_range, obj_gold_chunk, false, true, self.gold_detect_buffer, true);
	if count > 0 {
		for (var i = 0; i < count; i += 1;) {
			var val = ds_list_find_value(self.gold_detect_buffer, i);
			if val.can_be_interacted_with == true {
				return val;
			}
		}
	}
	return noone;
}

function run_gold_detection() {
	var gold = detect_gold_around();
	if gold != noone {
		self.target = gold;
		change_state(EnemyState.following_target);
	} else {
		if self.target != noone {
			self.target = noone;
			change_state(EnemyState.wandering);
		}
	}
}

function is_visible_on_screen() {
	var cam = view_camera[0];
	var _x = camera_get_view_x(cam);
	var _y = camera_get_view_y(cam);
	var w = _x + camera_get_view_width(cam);
	var h = _y + camera_get_view_height(cam);
	return point_in_rectangle(x, y, _x, _y, w, h);
}

function check_if_on_screen() {
	//do not run this logic if goblin is not holding a gold piece; we want them to still walk around when not on screen
	if self.held_gold_object == noone { return; }
	
	var is_visible = is_visible_on_screen();
	if is_visible and not self.last_visible {
		self.disappear_timer = -1;
		show_debug_message("Enemy became visible!");
	} else {
		if self.last_visible and not is_visible {
			show_debug_message("Enemy became invisible!");
			self.disappear_timer = self.disappear_time_value;
		} else if not is_visible {
			show_debug_message("Enemy still is not visible")
			self.disappear_timer -= delta_time / 1000000;
			if self.disappear_timer <= 0 {
				show_debug_message("Enemy not visible for too long");
				instance_destroy(self);
				
				if self.held_gold_object != noone {//dupochron
					instance_destroy(self.held_gold_object);
				}
			}
		}
	}
	
	self.last_visible = is_visible;
}

function check_if_wall_in_front(tb) {
	var hor_tile = instance_place(x + self.current_direction * self.collision_detection_range, y, oCollision);
	if hor_tile != noone and not jumping and tb != noone {
		var jump_str = self.jump_height;
		var check_height = hor_tile.y - sprite_height / 2 - 1;
		if EnemyState.running_away == self.state {
			jump_str = self.run_away_jump_height;
			check_height = hor_tile.y - sprite_height - sprite_height / 2 - 1
		}
		if place_meeting(hor_tile.x, check_height, oCollision) {
			self.current_direction = -self.current_direction;
		} else {
			vsp = jump_str;
			self.jumping = true;
		}
	}
}

function check_if_gap_in_front(tb) {
	if tb != noone and not jumping {
		var _x = self.x + (self.sprite_width / 4) * self.current_direction;
		var line_length = tb.sprite_height * 2;
		line_length += sprite_height / 2;
		var jump_str = self.jump_height;
		if EnemyState.running_away == self.state {
			jump_str = self.run_away_jump_height;
		}
		var hit = collision_line(_x, y, _x, y + line_length, oCollision, false, true);
		if (hit != noone) {
				
		} else {
			vsp = jump_str;
			self.jumping = true;
		}
	}
}

function  run_collision_detection() {
	if place_meeting(x + hsp, y, oCollision) {
		while (abs(hsp) > 0.1) {
			hsp *= 0.5;
			if (!place_meeting(x+hsp, y, oCollision)){
				x+= hsp;	
			}
		}
		hsp = 0;
	}
	x = x +hsp;

	//vertical
	if place_meeting(x, y + vsp, oCollision) {
		while (abs(vsp) > 0.1) {
			vsp *= 0.5;
			if (!place_meeting(x, y+vsp, oCollision)){
				y+= vsp;	
			}
		}
		vsp = 0;
	}
	y = y +vsp;
}

function get_state_name(stateval) {
	var n;
	switch (stateval) {
		case EnemyState.idle: {
			n = "Idle";
			break;
		}
		case EnemyState.wandering: {
			n = "Wander";
			break;
		}
		case EnemyState.following_target: {
			n = "Target follow";
			break;
		}
		case EnemyState.running_away: {
			n = "Run away";
			break;
		}
	}
	return n;
}

function change_state(newstate) {
	self.state = newstate;
	
	show_debug_message(string_concat("State of enemy changed. New: ", get_state_name(newstate)));
}

ds_list_clear(self.gold_detect_buffer);
var dt = delta_time / 1000000;

var tile_below = collision_line(x, y, x, y + sprite_height / 2 + 1, oCollision, false, true);
if (self.jumping && tile_below != noone) {
	self.jumping= false; // hihihoho >:3
}

switch (self.state){
	case EnemyState.wandering: {
		//todo: shoot a raycast (line of sight) and if it hits a gold chunk then immediately change the state to go towards the gold
		if self.wander_target_choose_timer > 0 {
			if not jumping {
				self.wander_target_choose_timer -= dt;
			}
		} else {
			change_state(EnemyState.idle);
			self.idle_timer = random_range(self.idle_timer_min, self.idle_timer_max);
		}
		
		self.hsp = self.current_direction * self.enemy_speed;
		
		check_if_gap_in_front(tile_below);
		check_if_wall_in_front(tile_below);
		run_gold_detection();
		
		break;
	}
	
	case EnemyState.idle: {
		//sniffing out gold
		if self.idle_timer > 0 {
			self.idle_timer -= dt;
		} else {
			self.current_direction = -self.current_direction;
			change_state(EnemyState.wandering);
			self.wander_target_choose_timer = random_range(self.wander_timer_min, self.wander_timer_max);
		}
		
		hsp = 0;
		
		run_gold_detection();
		
		break;
	}
	
	case EnemyState.following_target: {
		if self.target == noone || point_distance(x,y,self.target.x, self.target.y) > self.gold_sniffing_range {
			change_state(EnemyState.wandering);
			self.wander_target_choose_timer = random_range(self.wander_timer_min, self.wander_timer_max);
		} else {
			check_if_wall_in_front(tile_below);
			check_if_gap_in_front(tile_below);
			if instance_exists(self.target) {
				var _x = self.target.x - x;
				var dir = sign(_x);
				if dir == 0 { dir = 1; }
				self.current_direction = dir;
				hsp = run_away_and_chase_speed * self.current_direction;
			} else {
				self.target = noone;
			}
		}
		
		break;
	}
	
	case EnemyState.running_away: {
		//if he holds a gold chunk then he runs away 
		if self.player_ref == noone {
			change_state(EnemyState.wandering);
			self.wander_target_choose_timer = random_range(self.wander_timer_min, self.wander_timer_max);
		} else {
			check_if_wall_in_front(tile_below);
			check_if_gap_in_front(tile_below);
			var _x = self.player_ref.x - x;
			var s = sign(_x);
			if s == 0{s=1;}
			s = -s; //uciekamy od gracza, więc negacja
			self.current_direction = s;
			hsp = self.current_direction * self.run_away_and_chase_speed;
			check_if_on_screen();
		}
		break;
	}
}

self.vsp += self.grv;

run_collision_detection();
if self.held_gold_object == noone || !instance_exists(self.held_gold_object) {
	if can_pick_up_gold {
		var gold = instance_place(x, y, obj_gold_chunk);
		if gold != noone && gold != oPlayer.currently_picked_up {
			if gold.can_be_interacted_with == true {
				change_state(EnemyState.running_away);
				self.wander_target_choose_timer = random_range(self.wander_timer_min, self.wander_timer_max)
				self.held_gold_object = gold;
				self.target = noone;
				gold.can_be_interacted_with = false;
				gold.phy_active = false;
				//bo z jakiegoś powodu akurat rzucając w goblina dziedziczona jest prędkość
				gold.phy_angular_velocity = 0;
				gold.phy_linear_velocity_x = 0;
				gold.phy_linear_velocity_y = 0;
			}
		}
	}
}

if self.held_gold_object != noone && instance_exists(self.held_gold_object) {
	//jeśli na ciało działa fizyka, to trzeba ustawić phy_position nawet jeśli dziad ma wyłączoną symulację fizyki -.-
	self.held_gold_object.phy_position_x = x + held_gold_x_offset * self.current_direction;
	self.held_gold_object.phy_position_y = y + held_gold_y_offset
}



// Animation
if (!place_meeting(x, y + 1, oCollision))
{
	/// jump animation
	
	//sprite_index = sPlayerAir;
	//image_speed = 0;
	//if (sign(vsp) > 0)
	//{
	//	image_index = 1;
	//}
	//else
	//{
	//	image_index = 0;
	//}
}
else // on ground
{
	image_speed = 1;
	
	if (hsp == 0)
	{
		sprite_index = sGoblin;
	}
	else
	{
		sprite_index = sGoblinR;
	}
}

if (hsp != 0)
{
	image_xscale = sign(hsp);
}


