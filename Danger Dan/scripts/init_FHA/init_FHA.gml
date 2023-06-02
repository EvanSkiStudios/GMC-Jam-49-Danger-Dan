// Play sound like this
//fhAudioSoundPlay(SND_SHOOT1);

//fhAudioMusicCrossfade(MUSIC_RESOURCE_NAME_IN_BROWSER, fadetime in milliseconds, if to remember where it was before)


//#macro SND_TEST_MOVE "snd_test_move"
#macro SND_SFX_PORTAL "snd_sfx_portal"
#macro SND_SFX_SQUISH "snd_sfx_squish"
#macro SND_SFX_LASER_START "snd_sfx_laser_start"
#macro SND_SFX_LASER_LOOP "snd_sfx_laser_loop"
#macro SND_SFX_LASER_FINISH "snd_sfx_laser_finish"



function FhInitAudio()
{
	fhAudioInitialize();
	
//intro and main menu music
	//fhAudioMusicSetLoopPoints(snd_mus_intro, 11338, 64251);
	//fhAudioMusicRoomChangeSet(rm_mainmenu,snd_mus_intro);
	
//credits
	//fhAudioMusicRoomChangeSet(rm_final_scene,snd_mus_victory);
	
//levels
	//fhAudioMusicRoomChangeSet(pat_test_room,snd_mus_levels);
	
//boss music
	//fhAudioMusicSetLoopPoints(snd_mus_boss, 3200, 48000);
	
	//set catagory volume like so -> ADD TO MENU SYSTEM, this works for now but cant be player controlled
	fhAudioVolumeCategorySet(FHAUDIO_CATEGORY_GAME, 0.5);
	
	fhAudioVolumeMusicSet(1.0);
	fhAudioVolumeMasterSet(1.0);
	
	//fhAudioVolumeMasterGet();
	//fhAudioVolumeMusicGet();
	
	//SFX
	//fhAudioFHFXCreate(SND_TEST_MOVE,  FHAUDIO_CATEGORY_GAME,  snd_test_move,   0.0, 0.0 );

	fhAudioFHFXCreate(SND_SFX_PORTAL,		FHAUDIO_CATEGORY_GAME,  snd_sfx_portal,			0.05, 0.0);
	fhAudioFHFXCreate(SND_SFX_SQUISH,		FHAUDIO_CATEGORY_GAME,  snd_sfx_squish,			0.05, 0.0);
	fhAudioFHFXCreate(SND_SFX_LASER_START,	FHAUDIO_CATEGORY_GAME,  snd_sfx_laser_start,	0.05, 0.0);
	fhAudioFHFXCreate(SND_SFX_LASER_LOOP,	FHAUDIO_CATEGORY_GAME,  snd_sfx_laser_loop,		0.05, 0.0);
	fhAudioFHFXCreate(SND_SFX_LASER_FINISH,	FHAUDIO_CATEGORY_GAME,  snd_sfx_laser_finish,	0.05, 0.0);
	
}