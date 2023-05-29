switch(state){
	
	case convayer_states.start_moving:{
		if (path_index = -1){
			y = 7;
			path_start(pth_convayer_HH,1,path_action_restart,true);	
		}
		//switch to picking up
		if (x <= 96){
			x = 96;
			path_end();
			state =  convayer_states.picking_up;
		}
		
	}break;
	
	
	case convayer_states.picking_up:{
		if (sprite_index != spr_convay_claw_HH){
			sprite_index = spr_convay_claw_HH;	
		}
		
		if !(image_yscale >= 1.4){
			image_yscale += 0.02;	
		}else{
			image_yscale = 1.4;
			
			if instance_exists(obj_crate_drop_point_HH){
				if (place_meeting(x,30,obj_crate_HH)){
					state = convayer_states.picked_up_crate;
					break;
				}
			}
			if instance_exists(obj_dan){
				if (place_meeting(x,30,obj_crate_HH)){
					state = convayer_states.picked_up_dan;
					break;
				}
			}
			state = convayer_states.picked_up_nothing;
		}
	}break;
	
	case convayer_states.picked_up_nothing:{
		if !(image_yscale <= 0.7){
			image_yscale -= 0.02;	
		}else{
			image_yscale = 1;
			sprite_index = spr_claw_empty_HH;
			state = convayer_states.continue_moving;
		}
	}break;
	
	case convayer_states.picked_up_crate:{
		with(obj_crate_HH){
			instance_destroy();	
		}
		sprite_index = spr_claw_box_HH;
		
		if !(image_yscale <= 0.7){
			image_yscale -= 0.02;	
		}else{
			image_yscale = 1;
			sprite_index = spr_crate_on_line_HH;
			state = convayer_states.continue_moving;
		}
	}break;
	
	case convayer_states.continue_moving:{
		if (path_index = -1){
			if !(x <= -sprite_width){
				y = 7;
				path_start(pth_convayer_HH, 1, path_action_stop, false);
			}else{
				sprite_index = spr_claw_empty_HH;
				state =  convayer_states.start_moving;	
			}
		}	
	}
	
}