switch(state){
	
	case DD_convayer_states.start_moving:{
		if (path_index = -1){
			path_start(pth_convayer_DD,1,path_action_restart,true);	
		}
		//switch to picking up
		if (x >= 98){
			x = 100;
			path_end();
			if !(instance_exists(obj_crate_DD)){ 
				state = DD_convayer_states.drop_crate;
			}else{
				state =	DD_convayer_states.continue_moving;
			}
		}
		
	}break;
	
	case DD_convayer_states.continue_moving:{
		if (path_index = -1){
			if !(x >= room_width+sprite_width){
				path_start(pth_convayer_DD, 1, path_action_stop, false);
			}else{
				sprite_index = spr_crate_on_line_DD;
				state = DD_convayer_states.start_moving;	
			}
		}	
	}break;
	
	case DD_convayer_states.drop_crate:{
		sprite_index = spr_claw_empty_DD;
		instance_create_depth(97,116, (obj_portal.depth - 5),obj_crate_DD);
		state =	DD_convayer_states.continue_moving;
	}break;
}