// feather ignore GM2017

/// @func fhAudioMusicStop(_fadeTime = 0)
/// @desc Stops music, fading out if specified
/// @param {real} _fadeTime Time to take to perform the fadeout
/// @returns {bool} true Always returns True
function fhAudioMusicStop(_fadeTime = 0)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioMusicStop()");
		if(_fadeTime < 0)
			__fhAudioThrowError("Called fhAudioMusicStop() with a negative fading time.");
	}
	with(__fhAudioObjController)
	{
		__fhAudioStopFadedTrack();
		if(currentMusicRef != -1)
		{
			__fhAudioStoreMusicPos(false);
			if(_fadeTime > 0)
			{
				alarm[0] = _fadeTime/1000*game_get_speed(gamespeed_fps);
				audio_sound_gain(currentMusicRef, 0, _fadeTime);
			}
			else
			{
				audio_stop_sound(currentMusicRef);
				currentMusicRef = -1;
				currentMusicTrack = -1;
			}
		}
		musicStatus = __FHAUDIO_STATUS_STOPPED;
	}
	return true;
}

/// @func fha_music_stop(_fadeTime = 0)
/// @desc Stops music, fading out if specified
/// @param {real} _fadeTime Time to take to perform the fadeout
/// @returns {bool} true Always returns True
function fha_music_stop(_fadeTime = 0)
{
	return fhAudioMusicStop(_fadeTime);
}