// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//self explanatory
function damage_tile(_tile, _damage_value){
	_tile.current_health -= _damage_value;
	if _tile.current_health <= 0 {
		instance_destroy(_tile);
	}
}

/*enum AUTO_TILE_DIRECTION {
	NORTH_WEST = 1,
	NORTH = 2,
	NORTH_EAST = 4,
	WEST = 8,
	EAST = 16,
	SOUTH_WEST = 32,
	SOUTH = 64,
	SOUTH_EAST = 128
}*/

function auto_tile(_tile){
	var base_size = _tile.sprite_width;
	_tile.image_speed = 0; //żeby się nie animowało

	var WR, WL, WU, WD, WDDR, WDDL, WDUR, WDUL;
	with (_tile) {
		WR = position_meeting(_tile.x + base_size, _tile.y, obj_environment_tile);
		WL = position_meeting(_tile.x - base_size, _tile.y, obj_environment_tile);
		WU = position_meeting(_tile.x, _tile.y - base_size, obj_environment_tile);
		WD = position_meeting(_tile.x, _tile.y + base_size, obj_environment_tile);
		WDDR = position_meeting(_tile.x + base_size, _tile.y + base_size, obj_environment_tile); //diagonal right down
		WDDL = position_meeting(_tile.x - base_size, _tile.y + base_size, obj_environment_tile);//diagonal left down
		WDUR = position_meeting(_tile.x + base_size, _tile.y - base_size, obj_environment_tile);//diagonal right up
		WDUL = position_meeting(_tile.x - base_size, _tile.y - base_size, obj_environment_tile);//diagonal left up
	}

	var img_index = 0;
	//todo: jeszcze sprawdzać po diagonali
	//todo: tutaj zrobić całą tą drabinkę ifów z auto tilingiem stąd: 
	//https://www.youtube.com/watch?v=0HZ2edP31fY
	if (!WL && !WU && WD && WR) {
		//po prawej i na dole
		img_index = 0;
		if (WDDR) { //jak jeszcze jest diagonala
			img_index = 6;
		}
	} else if (WR && WL && !WU && WD) {
		//wszędzie poza górą
		img_index = 6; //tutaj olewamy diagonale
	} else if (WL && WD && !WR && !WU) {
		//na dole i po lewej
		img_index = 0;
		if (WDDL and WDUL) {
			img_index = 6;
		} else if (WDDL and not WDUL) {
			img_index = 3;
		}
	} else if (!WR && WL && WU && WD) {
		//wszędzie poza prawą
		img_index = 1;
		if (WDDL or WDUL) {
			img_index = 8;
		}
	} else if (WU && WL && !WR && !WD){
		//na górze i po lewej
		img_index = 7;
		if (WDUL and not WDDL) {
			img_index = 2;
		}
	} else if (WL && WR && WU && !WD) {
		//wszędzie poza dołem
		img_index = 1;
		if (WDUR and WDUL){
			img_index = 7;
		}
	} else if (!WL && !WD && WU && WR) {
		//na górze i po prawej
		img_index = 0;
		if (WDUR and not WDDR) {
			img_index = 1;
		}
	} else if (!WL && WU && WD && WR) {
		//wszędzie poza lewą
		img_index = 1;
	} else if (WL && WR && WD && WU) {
		//wszędzie dookoła
		img_index = irandom_range(10, 13);
	}
	
	_tile.image_index = img_index;
}

function update_auto_tiling_for_surrounding_tiles(_tile) {
	var inst_left, inst_right, inst_up, inst_down;
	var inst_left_up_diag, inst_right_up_diag;
	var inst_left_down_diag, inst_right_down_diag;
	var notify_array = [];

	var base_size = _tile.sprite_width;
	
	//instance_place ma zwodniczą nazwę; tak naprawdę to sprawdza kolizje, przesuwając obiekt
	with (_tile) {
		inst_left = instance_place(_tile.x - base_size, _tile.y, obj_environment_tile);
		inst_right = instance_place(_tile.x + base_size, _tile.y, obj_environment_tile);
		inst_up = instance_place(_tile.x, _tile.y - base_size, obj_environment_tile);
		inst_down = instance_place(_tile.x, _tile.y + base_size, obj_environment_tile);
		
		inst_right_down_diag = instance_place(_tile.x + base_size, _tile.y + base_size, obj_environment_tile);
		inst_right_up_diag = instance_place(_tile.x + base_size, _tile.y - base_size, obj_environment_tile);
		inst_left_down_diag = instance_place(_tile.x - base_size, _tile.y + base_size, obj_environment_tile);
		inst_left_up_diag = instance_place(_tile.x - base_size, _tile.y - base_size, obj_environment_tile);
		notify_array = [inst_left, inst_right, inst_up, inst_down, inst_right_down_diag, inst_right_up_diag, inst_left_down_diag, inst_left_up_diag];
	}
	
	//ustawienie alarmu na 1 wywołuje event Alarm 0 w obiekcie tile'a
	
	for (var i = 0; i < 8; i += 1;) {
		var inst = notify_array[i];
		if inst != noone {
			inst.alarm[0] = 1;
		}
	}
}
