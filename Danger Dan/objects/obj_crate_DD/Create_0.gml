flag_drop = true;

start_x = x;

drop_y = 126;
drop_speed = 3;

change_diminsion = function(){
	instance_destroy();
	instance_create_depth(x,y,depth, obj_crate_HH);
}