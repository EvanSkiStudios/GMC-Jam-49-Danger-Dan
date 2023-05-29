switch(state){
	
	case DD_convayer_states.start_moving:{
		if (path_index = -1){
			path_start(pth_convayer_DD,1,path_action_restart,true);	
		}
		//switch to picking up
		if (x >= 14){
			x = 16;
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
		instance_create_layer(13,116,"Instances",obj_crate_DD);
		state =	DD_convayer_states.continue_moving;
	}break;
}