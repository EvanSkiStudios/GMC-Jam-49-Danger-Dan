if !(do_fade_out){
	fade_alpha += 0.05;
}else{
	fade_alpha -= 0.05;	
}

if (fade_alpha >= 1){
	room_goto(rm_mainmenu);
}

if (do_fade_out) && (fade_alpha <= 0){
	instance_destroy();
}