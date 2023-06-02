#macro GAMESPEED game_get_speed(gamespeed_fps)

global.player_control = true;

enum ROOMS{
	DD = 0,
	HH = 1
}

global.DAN_IS_IN_ROOM = ROOMS.DD;

//DAN STUFF
enum DAN_STATE{
	alive = 0,
	death_squash,
	death_laser
}