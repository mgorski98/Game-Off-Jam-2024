/// @description Insert description here
// You can write your code in this editor
event_inherited();

can_be_interacted_with = false;

audio_play_sound(chest_creak, 10, false);
alarm[0] = game_get_speed(gamespeed_fps) * spawn_interval;
self.image_speed = 1;
