// feather ignore GM2017

/// @func fhAudioMusicCrossfade(musicTrack, _fadeTime = 1000, _fromBeginning = false)
/// @desc Plays a music track, fading it in if specified, instantly stopping the previous playing track
/// @param {Asset.GMSound} musicTrack Music to play
/// @param {real} _fadeTime Time to take to fade the new track in
/// @param {bool} _fromBeginning True plays the track from the beginning, false to continue where it left off
/// @returns {Id.Sound} reference Reference to playing music
function fhAudioMusicPlay(musicTrack, _fadeTime = 1000, _fromBeginning = false)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioMusicPlay()");
		__fhAudioAssertArgumentNotUndefined("fhAudioMusicPlay()", "musicTrack", musicTrack);
		if(_fadeTime < 0)
			__fhAudioThrowError("Called fhAudioMusicPlay() with a negative fading time.");
	}
	with(__fhAudioObjController)
	{
		alarm[0] = 0;
		__fhAudioStoreMusicPos(false);
		currentMusicTrack = musicTrack;
		lastMusicTrack = currentMusicTrack;
		if(currentMusicRef != -1)
			audio_stop_sound(currentMusicRef);
		if(musicTrackPositions[$ string(musicTrack)] != undefined)
		{
			if(!_fromBeginning)
			{
				currentMusicRef = audio_play_sound(currentMusicTrack, 1, true, 0, musicTrackPositions[$ string(currentMusicTrack)]);
			}
			else
				currentMusicRef = audio_play_sound(currentMusicTrack, 0, true, 0);
			variable_struct_remove(musicTrackPositions, string(musicTrack));
		}
		else
			currentMusicRef = audio_play_sound(currentMusicTrack, 0, true, 0);
		audio_sound_gain(currentMusicRef, realMusicVolume, _fadeTime);
		musicStatus = __FHAUDIO_STATUS_PLAYING;
		var loopPoints = musicLoopPoints[$ string(currentMusicTrack)];
		if(loopPoints != undefined)
		{
			audio_sound_loop_start(currentMusicRef, loopPoints.beginningTime);
			audio_sound_loop_end(currentMusicRef, loopPoints.endingTime);
		}
	}
	return __fhAudioObjController.currentMusicRef;
}

/// @func fha_music_play(musicTrack, _fadeTime = 1000, _fromBeginning = false)
/// @desc Plays a music track, fading it in if specified, instantly stopping the previous playing track
/// @param {Asset.GMSound} musicTrack Music to play
/// @param {real} _fadeTime Time to take to fade the new track in
/// @param {bool} _fromBeginning True plays the track from the beginning, false to continue where it left off
/// @returns {Id.Sound} reference Reference to playing music
function fha_music_play(musicTrack, _fadeTime = 1000, _fromBeginning = false)
{
	return fhAudioMusicPlay(musicTrack, _fadeTime, _fromBeginning);
}