var _W,_A,_S,_D,dx,dy;
_W=0;_A=0;_S=0;_D=0;dx=0;dy=0;

if (global.player_control){

	var _W = keyboard_check(ord("W"));
	var _A = keyboard_check(ord("A"));
	var _S = keyboard_check(ord("S"));
	var _D = keyboard_check(ord("D"));

	var dx = ( _D - _A );
	var dy = ( _S - _W );
}

if !(is_traveling){
	
	x += (player_speed * dx);
	y += (player_speed * dy);

	//animating the walk
	if ( (dx == 0) && (dy == 0) ){
		image_speed = 0;
		image_index = 0;
	}else{
		image_speed = 1;	
	}


	if (_D){
		sprite_index = spr_dan_walk_side;
		image_xscale = -1;	
	}
	if (_A){
		sprite_index = spr_dan_walk_side;
		image_xscale = 1;	
	}

	if (_W){
		sprite_index = spr_dan_walk_upp;
		image_xscale = 1;
	}
	if (_S){
		sprite_index = spr_dan_walk_dwn;
		image_xscale = 1;
	}
}else{
	if (image_index >= image_number-1){
		image_speed = 0;	
	}
	
	if !(place_meeting(x,y,obj_type_portal_trigger) ) && (image_speed == 0){
		//set to play reverse
		if (sprite_index == spr_dan_teleport_up){
			sprite_index = spr_dan_teleport_up_R;
			image_index = 0;
			image_speed = 1;
			exit;
		}
		if (sprite_index == spr_dan_teleport_down){
			sprite_index = spr_dan_teleport_down_R;
			image_index = 0;
			image_speed = 1;
			exit;
		}
		
		//will come back then end
		if (sprite_index == spr_dan_teleport_up_R){
			sprite_index = spr_dan_walk_upp;
			image_index = 0;
			is_traveling = false;
			global.player_control = true;
		}
		if (sprite_index == spr_dan_teleport_down_R){
			sprite_index = spr_dan_walk_dwn;
			image_index = 0;
			is_traveling = false;
			global.player_control = true;
		}
	}
}