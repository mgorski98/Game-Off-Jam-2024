/// @description Insert description here
// You can write your code in this editor
draw_self();
//todo: jak jest niszczony to narysować na nim sprite zniszczeń, tym wyraźniejszy/większy im mniej ma HP
//jak jest to tile z goldem, to narysować na nim jednego ze spriteów golda
//kolejność: self -> gold -> zniszczenia
if contains_gold && self.gold_overlay_sprite != undefined {
	//narysować teksturę złota
	draw_sprite(gold_overlay_sprite, -1, x, y);
}
if current_health != hit_durability {
	//narysować teksturę uszkodzeń
	var target_alpha = (hit_durability - current_health) / hit_durability;
	//todo: ustawić alphę i narysować teksturę uszkodzenia z nią
	//draw_set_alpha(target_alpha);
}