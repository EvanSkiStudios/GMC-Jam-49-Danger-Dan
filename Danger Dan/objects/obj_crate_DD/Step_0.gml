if (flag_drop){
	if (y >= (drop_y - drop_speed)){
		x = start_x;
		y = drop_y;
		flag_drop = false;
	}else{
		if instance_exists(obj_dan){
			//if dan is in a spot to be squashed
			if (obj_dan.y > 124){
				if (place_meeting(x,y,obj_dan)){
					global.player_control = false;
					if (obj_dan.state != DAN_STATE.death_squash){
						fha_sound_play(SND_SFX_SQUISH,false);
						obj_dan.state = DAN_STATE.death_squash;
					}
				}
			}
		}
		y += drop_speed;
	}
}