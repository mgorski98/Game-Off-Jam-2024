/// @description Insert description here
// You can write your code in this editor
event_inherited();

//po użyciu dźwigni flipnij sprite, ustaw flagę can_be_interacted_with na false i spraw, żeby winda jechała do góry
//winda po powrocie powinna ustawić w dźwigni flagę can_be_interacted_with na true, żeby dało się z powrotem pojechać
//dźwignia powinna zacząć z tą flagą na false i powinna zostać ustawiona na true dopiero jak gracz zdobył quotę
//po 1 wypełnionej quocie limit można znieść
obj_start_elevator.activate_elevator(-obj_start_elevator.elevator_direction);
image_xscale = -image_xscale;