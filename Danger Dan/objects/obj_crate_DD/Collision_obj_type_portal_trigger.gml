if (other.Travel_to_portal == obj_portal_2){
	new_y = 41;
	new_x = 54;
	y = new_y - (sprite_height/2);
	x = new_x;
	
	with(obj_dan){
		collide_crate = noone;	
	}
	
	change_diminsion();
}else{
	//Should not be a possible thing
}

