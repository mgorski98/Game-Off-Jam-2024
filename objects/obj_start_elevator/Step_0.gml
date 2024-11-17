/// @description Insert description here
// You can write your code in this editor

var _dt = delta_time / 1000000;

if self.elevator_going {
	if self.elevator_going_timer > 0 {
		self.elevator_going_timer -= _dt;
		self.y += self.elevator_direction * self.elevator_speed;
		obj_start_elevator_control_lever.y = self.y +  + obj_start_elevator_control_lever.sprite_height/4;
	} else {
		self.elevator_going = false;
		self.can_be_interacted_with = true;
		obj_start_elevator_control_lever.can_be_interacted_with = true;
		if self.elevator_direction < 0 {
			//winda jedzie do góry - niech zniknie na ~x sekund a potem wróci i zjedzie
			alarm[0] = elevator_disappear_time * game_get_speed(gamespeed_fps);
			elevator_disappeared = true;
		}
	}
}

self.can_be_interacted_with = not self.elevator_going and oPlayer.currently_picked_up != noone;