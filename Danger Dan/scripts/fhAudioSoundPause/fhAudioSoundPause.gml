// feather ignore GM2017

/// @func fhAudioSoundPause(sound, _fadeTime = 100)
/// @desc Pauses a specified sound, fading it out if specified
/// @param {ID.Sound} sound The sound to pause
/// @param {real} _fadeTime Time over which to fade out the sound
/// @returns {bool} true Always returns True
function fhAudioSoundPause(sound, _fadeTime = 100)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundPause()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPause()", "sound", sound);
		var record = __fhAudioObjController.playingSoundsMap[$ string(sound)];
		if(record == undefined)
			__fhAudioThrowError("Called fhAudioSoundPause() with an invalid sound.");
		if(_fadeTime < 0)
			__fhAudioThrowError("Called fhAudioSoundPause() with a negative fading time");
	}
	__fhAudioSoundPause(sound, _fadeTime);
	return true;
}

/// @func fha_sound_pause(sound, _fadeTime = 100)
/// @desc Pauses a specified sound, fading it out if specified
/// @param {ID.Sound} sound The sound to pause
/// @param {real} _fadeTime Time over which to fade out the sound
/// @returns {bool} true Always returns True
function fha_sound_pause(sound, _fadeTime = 100)
{
	return fhAudioSoundPause(sound, _fadeTime);
}