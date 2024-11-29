// Get Player Input
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);
key_jump_held = keyboard_check(vk_space);


// Calculate Movement
var move = key_right - key_left;
hsp = move * walksp;
vsp = vsp + grv;

jumpbuffer -= 1
if (key_jump)
{
	jumpbuffer = 10;
}

coyotetime -= 1;
if (coyotetime > 0) && (jumpbuffer > 0)
{
	vsp = -7;
	coyotetime = 0;
}

if (vsp < 0) && (!key_jump_held)
{
	vsp = max(-3.5, vsp);	
}

// Horizontal Collision
if (place_meeting(x + hsp, y, oCollision))
{
	while (!place_meeting(x + sign(hsp), y, oCollision))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

// Vertical Collision
if (place_meeting(x, y + vsp, oCollision))
{
	while (!place_meeting(x, y + sign(vsp), oCollision))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

// Animation
if (!place_meeting(x, y + 1, oCollision))
{
	sprite_index = sPlayerAir;
	image_speed = 0;
	if (sign(vsp) > 0)
	{
		image_index = 1;
	}
	else
	{
		image_index = 0;
	}
}
else
{
	coyotetime = 7;
	image_speed = 1;
	
	if (hsp == 0)
	{
		sprite_index = sPlayerIdle;
	}
	else
	{
		sprite_index = sPlayerRun;
	}
}

if (hsp != 0)
{
	image_xscale = sign(hsp);
}

run_interaction_logic();

mark_mineable_tile_in_range();

if (mouse_check_button_pressed(mb_left) and self.currently_picked_up == noone and can_mine) {
	var mouse_dir = point_direction(x,y,mouse_x,mouse_y);
	var end_x = lengthdir_x(mining_range, mouse_dir);
	var end_y = lengthdir_y(mining_range, mouse_dir);
	
	var items = physics_raycast(x, y, x + end_x, y + end_y, obj_environment_tile);
	if array_length(items) > 0 {
		var hit = array_get(items, 0);
		var hit_tile = hit.instance;
		hit_tile.spawn_debris(hit.hitpointX, hit.hitpointY);
		damage_tile(hit_tile, mining_damage);
		can_mine = false;
		
		audio_play_sound(choose(pickaxe_hit_1, pickaxe_hit_2, pickaxe_hit_3), 10, false);
	} else {
		var goblin = collision_line(x, y, x + end_x, y + end_y, obj_goblin, false, true);
		if goblin != noone {
			var gold = goblin.held_gold_object;
			audio_play_sound(goblin_hit, 10, false)
			goblin.can_pick_up_gold = false;
			goblin.drop_held_gold();
			goblin.change_state(EnemyState.running_away);
			var drop_mul = goblin_drop_gold_force_mul;
			with (gold) {
				physics_apply_force(gold.x, gold.y, lengthdir_x(drop_mul, mouse_dir), lengthdir_y(drop_mul, mouse_dir));
			}
		}
	}
	
	alarm[0] = game_get_speed(gamespeed_fps) * mine_cooldown_secs;
}

run_throw_logic();


//var lay_id = layer_get_id("Tiles");
//var map_id = layer_tilemap_get_id(lay_id);

//var roomX = tilemap_get_cell_x_at_pixel(map_id, x, y + 32)
//var roomY = tilemap_get_cell_y_at_pixel(map_id, x, y + 32)

////show_debug_message(roomX)
////show_debug_message(roomY)

//var data = tilemap_get(map_id, roomXd, roomY);
//if (!tile_get_empty(data))
//{
//	//show_debug_message(data)

//    data = tile_set_empty(data)
//    tilemap_set(map_id, data, roomX, roomY);
//}


//var lay_id = layer_get_id("Tiles");
//var map_id = layer_tilemap_get_id(lay_id);

//var data = tilemap_get_at_pixel(map_id, 21, 13);
//show_debug_message(data)
//data = tile_set_flip(data, true);
//tilemap_clear(map_id, data);
//tile_set_empty(data);
//tilemap_set_at_pixel(0, data, 21, 13)
//tilemap_set_at_pixel(map_id, data, x, y  + 10);




