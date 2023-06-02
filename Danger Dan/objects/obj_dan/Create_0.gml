player_speed = 0.75;

is_traveling = false;

potential_x = 0;
potential_y = 0;

collide_crate = noone;

state = DAN_STATE.alive;

//Is you is listener? yes okay great thx
fha_listener_set_instance_to_follow(id);