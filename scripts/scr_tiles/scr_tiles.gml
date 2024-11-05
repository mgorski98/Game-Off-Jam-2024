// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//self explanatory
function damage_tile(_tile, _damage_value){
	_tile.current_health -= _damage_value;
	if _tile.current_health <= 0 {
		instance_destroy(_tile);
	}
}

function auto_tile(_tile){
	var base_size = _tile.sprite_width;
	_tile.image_speed = 0; //żeby się nie animowało

	var WR, WL, WU, WD, WDDR, WDDL, WDUR, WDUL;
	with (_tile) {
		WR = position_meeting(_tile.x + base_size, _tile.y, obj_environment_tile);
		WL = position_meeting(_tile.x - base_size, _tile.y, obj_environment_tile);
		WU = position_meeting(_tile.x, _tile.y - base_size, obj_environment_tile);
		WD = position_meeting(_tile.x, _tile.y + base_size, obj_environment_tile);
		WDDR = position_meeting(_tile.x, _tile.y, obj_environment_tile); //diagonal right down
		WDDL = position_meeting(_tile.x, _tile.y, obj_environment_tile);//diagonal left down
		WDUR = position_meeting(_tile.x, _tile.y, obj_environment_tile);//diagonal right up
		WDUL = position_meeting(_tile.x, _tile.y, obj_environment_tile);//diagonal left up
	}
	
	var scale_x = abs(_tile.image_xscale), scale_y = abs(_tile.image_yscale);
	var img_index = 0;
	var angle = 0;
	//todo: jeszcze sprawdzać po diagonali
	//todo: tutaj zrobić całą tą drabinkę ifów z auto tilingiem stąd: 
	//https://www.youtube.com/watch?v=0HZ2edP31fY
	if (!WL && !WU && WD && WR) {
		//po prawej i na dole
		img_index = 0;
	} else if (WR && WL && !WU && WD) {
		//wszędzie poza górą
		img_index = 1;
	} else if (WL && WD && !WR && !WU) {
		//na dole i po lewej
		img_index = 0;
		scale_x = scale_x * -1;
	} else if (!WR && WL && WU && WD) {
		//wszędzie poza prawą
		img_index = 1;
		angle = -90;
	} else if (WU && WL && !WR && !WD){
		//na górze i po lewej
		scale_y = scale_y * -1;
		scale_x = scale_x * -1;
	} else if (WL && WR && WU && !WD) {
		//wszędzie poza dołem
		img_index = 1;
		scale_y = scale_y * -1;
	} else if (!WL && !WD && WU && WR) {
		//na górze i po prawej
		img_index = 0;
		scale_y = scale_y * -1;
	} else if (!WL && WU && WD && WR) {
		//wszędzie poza lewą
		img_index = 1;
		angle = 90;
	} else if (WL && WR && WD && WU) {
		//wszędzie dookoła
		img_index = irandom_range(4, 10);
	}
	
	
	_tile.image_index = img_index;
	_tile.image_xscale = scale_x;
	_tile.image_yscale = scale_y;
	_tile.image_angle = angle;
}

function update_auto_tiling_for_surrounding_tiles(_tile) {
	var inst_left, inst_right, inst_up, inst_down;
	var base_size = _tile.sprite_width;
	
	//instance_place ma zwodniczą nazwę; tak naprawdę to sprawdza kolizje, przesuwając obiekt
	with (_tile) {
		inst_left = instance_place(_tile.x - base_size, _tile.y, obj_environment_tile);
		inst_right = instance_place(_tile.x + base_size, _tile.y, obj_environment_tile);
		inst_up = instance_place(_tile.x, _tile.y - base_size, obj_environment_tile);
		inst_down = instance_place(_tile.x, _tile.y + base_size, obj_environment_tile);
	}
	
	//ustawienie alarmu na 1 wywołuje event Alarm 0 w obiekcie tile'a
	
	if inst_left != noone {
		inst_left.alarm[0] = 1;
	}
	
	if inst_right != noone {
		inst_right.alarm[0] = 1;
	}
	
	if inst_up != noone {
		inst_up.alarm[0] = 1;
	}
	
	if inst_down != noone {
		inst_down.alarm[0] = 1;
	}
}
