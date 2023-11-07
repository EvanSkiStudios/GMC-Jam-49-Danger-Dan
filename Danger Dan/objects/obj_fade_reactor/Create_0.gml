audio_stop_all();
audio_play_sound(snd_sfx_explosion,1,false);
global.GAMESTATE = GAMESTATES.player_dead;

alarm[0] = 3 * GAMESPEED;

fade_alpha = 1;
do_fade = false;