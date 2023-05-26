var _W = keyboard_check(ord("W"));
var _A = keyboard_check(ord("A"));
var _S = keyboard_check(ord("S"));
var _D = keyboard_check(ord("D"));


var dx = ( _D - _A );
var dy = ( _S - _W );

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