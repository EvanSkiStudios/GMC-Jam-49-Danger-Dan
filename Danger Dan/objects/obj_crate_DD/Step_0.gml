if (flag_drop){
	if (y >= (drop_y - drop_speed)){
		x = start_x;
		y = drop_y;
		flag_drop = false;
	}else{
		y += drop_speed;
		
		if instance_exists(obj_dan){
			//if dan is in a spot to be squashed
			if (obj_dan.y > 127){
				if (place_meeting(x,y,obj_dan)){
					global.player_control = false;
					obj_dan.state = DAN_STATE.death_squash;
				}
			}
		}
	}
}