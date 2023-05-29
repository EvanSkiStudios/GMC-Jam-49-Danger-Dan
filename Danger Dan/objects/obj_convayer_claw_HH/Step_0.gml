switch(state){
	
	case HH_convayer_states.start_moving:{
		if (path_index = -1){
			y = 7;
			path_start(pth_convayer_HH,1,path_action_restart,true);	
		}
		//switch to picking up
		if (x <= 98){
			x = 96;
			path_end();
			state = HH_convayer_states.picking_up;
		}
		
	}break;
	
	case HH_convayer_states.continue_moving:{
		if (path_index = -1){
			if !(x <= -sprite_width){
				y = 7;
				path_start(pth_convayer_HH, 1, path_action_stop, false);
			}else{
				sprite_index = spr_claw_empty_HH;
				state = HH_convayer_states.start_moving;	
			}
		}	
	}break;
	
	
	case HH_convayer_states.picking_up:{
		if (sprite_index != spr_convay_claw_HH){
			sprite_index = spr_convay_claw_HH;	
		}
		
		if !(image_yscale >= 1.4){
			image_yscale += 0.02;	
		}else{
			image_yscale = 1.4;
			
			//CRATE
			if instance_exists(obj_crate_drop_point_HH){
				if (place_meeting(x,y,obj_crate_HH)){
					state = HH_convayer_states.picked_up_crate;
					break;
				}
			}
			//DAN
			if instance_exists(obj_dan){
				//if dan is in a spot to be grabed, this seems to work really well
				if (obj_dan.y > 27){
					if (place_meeting(x,y,obj_dan)){
						if (obj_dan.sprite_index != -1){
							state = HH_convayer_states.picked_up_dan;
							break;
						}
					}
				}
			}
			state = HH_convayer_states.picked_up_nothing;
		}
	}break;
	
	case HH_convayer_states.picked_up_nothing:{
		if !(image_yscale <= 0.7){
			image_yscale -= 0.02;	
		}else{
			image_yscale = 1;
			sprite_index = spr_claw_empty_HH;
			state = HH_convayer_states.continue_moving;
		}
	}break;
	
	case HH_convayer_states.picked_up_crate:{
		with(obj_crate_HH){
			instance_destroy();	
		}
		sprite_index = spr_claw_box_HH;
		
		if !(image_yscale <= 0.7){
			image_yscale -= 0.02;	
		}else{
			image_yscale = 1;
			sprite_index = spr_crate_on_line_HH;
			state = HH_convayer_states.continue_moving;
		}
	}break;
	
	case HH_convayer_states.picked_up_dan:{
		global.player_control = false;
		with(obj_dan){
			sprite_index = -1;
		}
		if (sprite_index != spr_claw_dan_HH){
			sprite_index = spr_claw_dan_HH;
			image_index = 0;
			image_speed = 1;
		}
		
		if (image_index >= image_number-1){
			image_speed = 0;
			image_index = image_number-1;
		}
		
		if !(image_yscale <= 0.8){
			image_yscale -= 0.02;	
		}else{
			image_yscale = 1;
			image_index = 0;
			sprite_index = spr_dan_on_line_HH;
			state = HH_convayer_states.continue_moving;
		}
	}break;
}