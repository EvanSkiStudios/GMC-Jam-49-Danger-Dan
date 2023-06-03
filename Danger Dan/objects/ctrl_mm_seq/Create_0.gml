layer_mm = layer_create(-500,"logo_seq_layer");

layer_seq_mm = layer_sequence_create(
	layer_mm,
	room_width/2,room_height/2,
	seq_mainmenu
);

layer_sequence_play(layer_seq_mm);
//layer_sequence_pause(layer_seq_mm);