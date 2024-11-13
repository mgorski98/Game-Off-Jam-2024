/// @description Insert description here
// You can write your code in this editor
//podnieść golda i z nim uciekać (tylko jeśli wcześniej nie było podniesionego golda. Ucieka w kierunku krawędzi ekranu)
//jak jest poza ekranem jakieś 2-3 sekundy to znika

if other.can_be_picked_up == true {
	change_state(EnemyState.running_away);
	self.held_gold_object = other;
	self.target = noone;
	other.can_be_picked_up = false;
}