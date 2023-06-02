if !(audio_is_playing(snd_sfx_portal)){
	fha_sound_play(SND_SFX_PORTAL,false);
}

if (Travel_to_portal == obj_portal_2){
	dan_sprite = spr_dan_teleport_up;
	dan_new_y = 44;
	camera_new_y = 0;
	global.DAN_IS_IN_ROOM = ROOMS.HH;
}else{
	dan_sprite = spr_dan_teleport_down;
	dan_new_y = 87;
	camera_new_y = 72;
	global.DAN_IS_IN_ROOM = ROOMS.DD;
}

global.player_control = false;

with(obj_dan){
	is_traveling = true;
	if (sprite_index != other.dan_sprite){
		image_index = 0;
		sprite_index = other.dan_sprite;
	}
}


if (obj_dan.image_speed == 0){
	
	camera_set_view_pos(view_camera[0], 0,camera_new_y);
	
	obj_dan.x = 59;
	obj_dan.y = dan_new_y;
}