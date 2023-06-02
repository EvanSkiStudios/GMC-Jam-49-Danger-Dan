// feather ignore GM2017

/// @func fhAudioSoundResume(sound, _fadeTime = 100)
/// @desc Resumes a specified sound, fading it in if specified
/// @param {ID.Sound} sound The sound to resume
/// @param {real} _fadeTime Time over which to fade in the sound
/// @returns {bool} true Always returns True
function fhAudioSoundResume(sound, _fadeTime = 100)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundResume()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundResume()", "sound", sound);
		var record = __fhAudioObjController.pausedSoundsMap[$ string(sound)];
		if(record == undefined)
			__fhAudioThrowError("Called fhAudioSoundResume() with an invalid sound.");
		if(_fadeTime < 0)
			__fhAudioThrowError("Called fhAudioSoundResume() with a negative fading time.");
	}
	__fhAudioSoundResume(sound, _fadeTime);
	return true;
}

/// @func fhAudioSoundResume(sound, _fadeTime = 100)
/// @desc Resumes a specified sound, fading it in if specified
/// @param {ID.Sound} sound The sound to resume
/// @param {real} _fadeTime Time over which to fade in the sound
/// @returns {bool} true Always returns True
function fha_sound_resume(sound, _fadeTime = 100)
{
	return fhAudioSoundResume(sound, _fadeTime);
}