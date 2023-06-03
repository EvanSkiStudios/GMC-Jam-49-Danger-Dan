var b_fullscreen = window_get_fullscreen();

if (b_fullscreen){
	window_set_fullscreen(false);
	alarm[0] = 1;
}else{
	window_set_fullscreen(true);
}

