// Clicking a light toggles it.
toggle(id);

// Then we check if the player wins.
if (is_clear()) {
	room_goto(rm_win);
}