if (DEBUG_AUTOSKIP_MENU) room_goto_next();

titlescreen_instructions = (
	"HOW TO PLAY"+"\n"+
	"MOVEMENT: WASD"+"\n"+
	"ACTION: SPACEBAR"+"\n"+
	"PAUSE: ESC"+"\n"+
	"READ THE README FOR MORE INFO!"
);
titlescreen_mini_credits = "COPYRIGHT 2023 Evanski Studios";

alpha = 1;

prepare_rainbow_text = function () {
	draw_set_color(c_white);
	//@feather ignore GM2026
	draw_set_halign(fa_center);
	draw_set_font(fnt_titlescreen);
}

draw_titlescreen_instructions = function () {
	prepare_rainbow_text();
	draw_text(display_get_gui_width() * .5, display_get_gui_height() * .7, titlescreen_instructions);
	draw_set_color(c_white);
}

draw_mini_credits = function () {
		prepare_rainbow_text();
		draw_text(display_get_gui_width() * .5, display_get_gui_height() * .95, titlescreen_mini_credits);
		draw_set_color(c_white);
}