if !(do_fade) exit;

fade_alpha -= 0.01;

if (fade_alpha <= 0){
	instance_destroy();	
}