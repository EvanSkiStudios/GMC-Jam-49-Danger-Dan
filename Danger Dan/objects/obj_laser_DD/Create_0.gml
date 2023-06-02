enum laser_states {
	start = 0,
	loop,
	finish,
	waiting
}

laser_cooldown = (GAMESPEED * 2.02);

laser_state = laser_states.waiting;
do_laser_loop = true;
do_laser_start = true;

laser_beeming = false;

x_offset = x - 2;
y_offset = y - 8;

target_x = x_offset;
target_y = 75;

image_index = 0;

alarm[0] = laser_cooldown;

my_emitter = fha_emitter_create(200,250);
fha_emitter_set_position(my_emitter, x,y);