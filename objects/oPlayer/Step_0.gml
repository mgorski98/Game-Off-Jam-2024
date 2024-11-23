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
if (place_meeting(x + hsp, y, [oWall, obj_environment_tile]))
{
	while (!place_meeting(x + sign(hsp), y, [oWall, obj_environment_tile]))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

// Vertical Collision
if (place_meeting(x, y + vsp, [oWall, obj_environment_tile]))
{
	while (!place_meeting(x, y + sign(vsp), [oWall, obj_environment_tile]))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

// Animation
if (!place_meeting(x, y + 1, [oWall, obj_environment_tile]))
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
		alarm[0] = game_get_speed(gamespeed_fps) * mine_cooldown_secs;
		can_mine = false;
	}
}

run_throw_logic();
