// feather ignore GM2017

/// @func fhAudioSoundStop(sound, _fadeTime = 0)
/// @desc Stops a specified sound, fading it out if specified
/// @param {ID.Sound} sound The sound to stop
/// @param {real} _fadeTime Time over which to fade out the sound
/// @returns {bool} true Always returns True
function fhAudioSoundStop(sound, _fadeTime = 0)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundStop()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundStop()", "sound", sound);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundStop()", "fadeTime", _fadeTime);
		var record = __fhAudioObjController.playingSoundsMap[$ string(sound)];
		if(record == undefined)
			__fhAudioThrowError("Called fhAudioSoundStop() with an invalid sound.");
		if(_fadeTime < 0)
			__fhAudioThrowError("Called fhAudioSoundStop() with a negative fading time.");
	}
	if(_fadeTime == 0)
	{
		audio_stop_sound(sound);
		variable_struct_remove(__fhAudioObjController.playingSoundsMap, string(sound));
	}
	else
	{
		audio_sound_gain(sound, 0, _fadeTime);
		var fading = new __fhAudioFadingSound(sound, _fadeTime);
		array_push(__fhAudioObjController.fadingSoundsList, fading);
	}
	return true;
}

/// @func fha_sound_stop(sound, _fadeTime = 0)
/// @desc Stops a specified sound, fading it out if specified
/// @param {ID.Sound} sound The sound to stop
/// @param {real} _fadeTime Time over which to fade out the sound
/// @returns {bool} true Always returns True
function fha_sound_stop(sound, _fadeTime = 0)
{
	return fhAudioSoundStop(sound, _fadeTime);
}