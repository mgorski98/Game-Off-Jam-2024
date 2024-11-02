switch(operation_type) {
	case 0:
		room_goto(rm_game_room);
		break;
	case 1:
		game_end(0);
		break;
	case 2:
		room_goto(rm_main_menu);
		break;
	default:
		break;
}
