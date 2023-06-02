// feather ignore GM2017

/// @func fhAudioSoundPlay(fhfx, _looped = false)
/// @desc Plays a specified fhfx, looping it if specified
/// @param {string} fhfx The fhfx to play(the string specified when it was created)
/// @param {bool} _looped True to loop the sound, false if not
/// @returns {Id.Sound} reference Reference to the playing sound
function fhAudioSoundPlay(fhfx, _looped = false)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundPlay()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlay()", "fhfx", fhfx);
		if(!is_string(fhfx))
			__fhAudioThrowError("Called fhAudioSoundPlay() with an invalid fhfx.");
		if(__fhAudioObjController.fhfxList[$ fhfx] == undefined)
		{
			__fhAudioThrowError("Called fhAudioSoundPlay() with an invalid fhfx.");
		}
	}
	var newSound = __fhAudioObjController.fhfxList[$ fhfx].playSound(_looped);
	if(_looped)
	{
		var add = new __fhAudioPlayingSound(newSound, __fhAudioObjController.fhfxList[$ fhfx].myCategory);
		__fhAudioObjController.playingSoundsMap[$ string(newSound)] = add;
	}
	return newSound;
}

/// @func fha_sound_play(fhfx, _looped = false)
/// @desc Plays a specified fhfx, looping it if specified
/// @param {string} fhfx The sound to play(the string specified when it was created)
/// @param {bool} _looped True to loop the sound, false if not
/// @returns {Id.Sound} reference Reference to the playing sound
function fha_sound_play(fhfx, _looped = false)
{
	return fhAudioSoundPlay(fhfx, _looped);
}