// feather ignore GM2017

/// @func fhAudioMusicSwapfade(musicTrack, _fadeTime = 1000)
/// @desc Swapfades the currently playing music with another one
/// @param {Asset.GMSound} musicTrack Music to swapfade to
/// @param {real} _fadeTime Time to take to perform the swapfade
/// @returns {Id.Sound} reference Reference to playing music
function fhAudioMusicSwapfade(musicTrack, _fadeTime = 1000)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioMusicSwapfade()");
		__fhAudioAssertArgumentNotUndefined("fhAudioMusicSwapfade()", "musicTrack", musicTrack);
	}
	var returnValue = -1;
	with(__fhAudioObjController)
	{
		alarm[0] = 0;
		if(currentMusicTrack == -1)
		{
			__fhAudioDebugLog("Attempted to Swapfade when no music is currently playing.");
			break;
		}
		else if(currentMusicTrack == musicTrack)
		{
			__fhAudioDebugLog("Attempted to Swapfade to the same music track that is already playing.");
			break;
		}
		else
		{
			fadingMusicRef = currentMusicRef;
			fadingMusicTrack = currentMusicTrack;
			currentMusicTrack = musicTrack;
			currentMusicRef = audio_play_sound(currentMusicTrack, 1, true, 0, audio_sound_get_track_position(fadingMusicRef));
			lastMusicTrack = currentMusicTrack;
			audio_sound_gain(currentMusicRef, realMusicVolume, _fadeTime);
			audio_sound_gain(fadingMusicRef, 0, _fadeTime);
			fadeTimeEnd = current_time + _fadeTime;
			musicStatus = __FHAUDIO_STATUS_SWAPFADING;
			returnValue = currentMusicRef;
		}
	}
	return returnValue;
}

/// @func fha_music_swapfade(musicTrack, _fadeTime = 1000)
/// @desc Swapfades the currently playing music with another one
/// @param {Asset.GMSound} musicTrack Music to swapfade to
/// @param {real} _fadeTime Time to take to perform the swapfade
/// @returns {Id.Sound} true Always returns True
function fha_music_swapfade(musicTrack, _fadeTime = 1000)
{
	return fhAudioMusicSwapfade(musicTrack, _fadeTime);
}