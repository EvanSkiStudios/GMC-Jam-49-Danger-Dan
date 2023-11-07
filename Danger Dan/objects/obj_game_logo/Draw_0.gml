draw_self();

var _x = round( ( x + (sprite_width/2) ) - (sprite_get_width(spr_title)/2) );
var _y = round( ( y + (sprite_height/4) ) - (sprite_get_height(spr_title)/2) );

draw_sprite(spr_title,0,_x,_y);

draw_set_color(c_white);

draw_titlescreen_instructions();
draw_mini_credits();

draw_set_halign(fa_left);