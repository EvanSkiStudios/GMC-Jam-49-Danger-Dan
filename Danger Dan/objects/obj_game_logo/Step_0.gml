//any key to continue
if (keyboard_check_released(vk_anykey)){
	var key = invaild_keys();
	if (key == false){
		//if !(instance_exists(obj_seq_titlescreen_trans)){
		//	instance_create_depth(x,y,depth,obj_seq_titlescreen_trans)
		//}
		room_goto_next();
	}
}