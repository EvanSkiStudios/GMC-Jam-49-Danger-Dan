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

//Hack for checking anykey but the ones we dont want, so check some keys
function invaild_keys(){
	if !keyboard_check_released(vk_f3){
	if !keyboard_check_released(vk_f7){
	if !keyboard_check_released(vk_f11){
	if !keyboard_check_released(vk_f12){
	if !keyboard_check_released(vk_alt){
	if !keyboard_check_released(vk_enter){
	if !keyboard_check_released(vk_escape){
	if !keyboard_check(vk_f3){
	if !keyboard_check(vk_f7){
	if !keyboard_check(vk_f11){
	if !keyboard_check(vk_f12){
	if !keyboard_check(vk_alt){
	if !keyboard_check(vk_enter){
	if !keyboard_check(vk_escape){
		return(false);
	}}}}}}}}}}}}}}
	return(true);
}

//@feather ignore GM2043
function ScreenShot(){
	static num = 0;
	
	var filename = (working_directory + "\\ScreenShots\\Screen_");
	
	do{
		//check to see if there is already a png
		var new_filename = (filename+string(num)+".png");
		if (file_exists(new_filename)){
			//if there is add one to the number until there isnt one
			++num;
		}
	}
	until (!file_exists(new_filename));
	
	//save the png
	screen_save(new_filename)
	//add to the number for a future png
	show_debug_message("Screen shot "+string(num)+" saved");
	++num;
}