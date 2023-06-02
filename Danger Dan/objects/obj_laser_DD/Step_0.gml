if (global.DAN_IS_IN_ROOM = ROOMS.DD){
	fha_emitter_set_falloff(my_emitter, 200, 250);
}else{
	//WHEN DAN IS IN HH
	fha_emitter_set_falloff(my_emitter, 60, 70);
}


switch(laser_state){
	case laser_states.start:{
		laser_beeming = true;
		
		if (do_laser_start){
			fha_sound_play_on_emitter(SND_SFX_LASER_START, my_emitter, false);
			do_laser_start = false;
			laser_state = laser_states.loop;
		}	
	}break;
	
	case laser_states.loop:{
		if (do_laser_loop){
			fha_sound_play_on_emitter(SND_SFX_LASER_LOOP, my_emitter, false);
			do_laser_loop = false;
		}
		
		laser_beeming = true;
		if !(audio_is_playing(snd_sfx_laser_loop)){
			laser_state = laser_states.finish;
		}
		
		//check if dan is in laser
		if (instance_exists(obj_dan)){
			if (point_in_rectangle(obj_dan.x,obj_dan.y, target_x-1,target_y-1,x+1,y+1)){
				with(obj_dan){
					state = DAN_STATE.death_laser; 		
				}
			}
		}
	}break;
	
	case laser_states.finish:{
		laser_beeming = false;
		
		fha_sound_play_on_emitter(SND_SFX_LASER_FINISH, my_emitter, false);
		laser_state = laser_states.waiting;
		
		//sets the timer
		alarm[0] = laser_cooldown;
	}break;
	
	case laser_states.waiting:{
		do_laser_loop = true;
		do_laser_start = true;
		//do nothing	
	}break;
}