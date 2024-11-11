/// @description Insert description here

//TODO; maybe the goblin despawns when it carries a gold chunk and is out of bounds of screen for a couple of seconds?
//todo: if he disappears then play a sound so that the player will know he nicked a gold chunk
//todo: maybe goblins hurt players on collision?
//todo: if goblins collide with gold, they pick it up and run the fuck away
//todo: set image_xscale when changing direction
//todo: in the walking states the goblin should also check for gaps in the ground and jump over them or (if they are too big) go back

var dt = delta_time / 1000000;

var tile_below = collision_line(x, y, x, y + sprite_height / 2 + 1, obj_environment_tile, false, true);
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
			self.state = EnemyState.idle; //sniff out the gold m8
			self.idle_timer = random_range(self.idle_timer_min, self.idle_timer_max);
		}
		
		self.hsp = self.current_direction * self.enemy_speed;
		
		//sprawdzamy na prawo/lewo i w górę
		//to prawdopodobnie trzeba sprawdzać w każdym stanie, nie tylko w tym
		var hor_tile = instance_place(x + self.current_direction * self.collision_detection_range, y, obj_environment_tile);
		if hor_tile != noone and not jumping and tile_below != noone {
			if place_meeting(hor_tile.x, hor_tile.y - sprite_height / 2 - 1, obj_environment_tile) {
				self.current_direction = -self.current_direction;
			} else {
				vsp = self.jump_height;
				self.jumping = true;
			}
		}
	
		show_debug_message(string_concat(self.current_direction, " ", jumping, " ", self.wander_target_choose_timer))
		if tile_below != noone and not jumping {
			var _x = self.x + (self.sprite_width / 4) * self.current_direction;
			var line_length = tile_below.sprite_height * 2;
			line_length += sprite_height / 2;
			var hit = collision_line(_x, y, _x, y + line_length, obj_environment_tile, false, true);
			if (hit != noone) {
				
			} else {
				vsp = self.jump_height;
				self.jumping = true;
			}
		}
	
		//jeśli jest ściana - skocz
		//jak wylądujesz w tym samym miejscu to znaczy że ściana jest za wysoka, więc zmień kierunek
		//ustawić vsp na wartość skoku jak jest wykryta niska ściana, przepaść, itd.
		
		//todo: just update the X position based on current direction
		
		//todo: shoot the line here. if it collides with a wall then try jumping up if it is tall enough
		//todo: if the line collides with gold then switch the state to following_target immediately
		
		//todo: jeśli gold jest trzymany przez gracza to na razie niech będzie bez zmian i niech goblin leci do gracza
		//jak gold mu zniknie to niech wraca do uciekania/wanderingu
		//w przyszłości można ignorować trzymany gold
		
		
		/*var hit_gold = collision_line(x, y, x + self.current_direction * self.gold_sniffing_range, y, obj_gold_chunk, false, true);
		if hit_gold == noone {
			//check around
			hit_gold = collision_circle(x, y, self.gold_sniffing_range, obj_gold_chunk, false, true);
			if hit_gold != noone {
				self.state = EnemyState.following_target;
				self.target = hit_gold;
			}
		}*/
		
		//todo: zaimplementować najpierw movement i przetestować czy wandering działa
		
		break;
	}
	
	case EnemyState.idle: {
		//sniffing out gold
		if self.idle_timer > 0 {
			self.idle_timer -= dt;
			//todo: sniff out close gold; do a collision circle to detect them
			
			//todo: play correct animation
		} else {
			self.current_direction = -self.current_direction;
			self.state = EnemyState.wandering;
			//todo: dodatkowo jeszcze czas wanderingu przypisz
			self.wander_target_choose_timer = random_range(self.wander_timer_min, self.wander_timer_max);
		}
		
		hsp = 0;
		
		break;
	}
	
	case EnemyState.following_target: {
		//go towards the closest gold chunk you detected
		//todo; detect the holes in the ground and try jumping over them if they are 1 or 2 tiles wide
		break;
	}
	
	case EnemyState.running_away: {
		//if he holds a gold chunk then he runs away 
		break;
	}
}

self.vsp = self.vsp + self.grv;

//horizontal
if place_meeting(x + hsp, y, obj_environment_tile) {
	while (abs(hsp) > 0.1) {
		hsp *= 0.5;
		if (!place_meeting(x+hsp, y, obj_environment_tile)){
			x+= hsp;	
		}
	}
	hsp = 0;
}
x = x +hsp;

//vertical
if place_meeting(x, y + vsp, obj_environment_tile) {
	while (abs(vsp) > 0.1) {
		vsp *= 0.5;
		if (!place_meeting(x, y+vsp, obj_environment_tile)){
			y+= vsp;	
		}
	}
	vsp = 0;
}
y = y +vsp;