// feather ignore GM2017

/// @func fhAudioFHFXAddSound(fhfx, sound)
/// @desc Adds a sound sound(resource) to an fhfx
/// @param {string} fhfx Name of the fhfx to add a sound to
/// @returns {bool} reference Reference to the playing music
function fhAudioFHFXAddSound(fhfx, sound)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioFHFXAddSound()");
		__fhAudioAssertArgumentNotUndefined("fhAudioFHFXAddSound()", "fhfx", fhfx);
		__fhAudioAssertArgumentNotUndefined("fhAudioFHFXAddSound()", "sound", sound);
		if(!is_string(fhfx))
			__fhAudioThrowError("Called fhAudioFHFXAddSound() with an invalid fhfx.");
		if(__fhAudioObjController.fhfxList[$ fhfx] == undefined)
		{
			__fhAudioThrowError("Called fhAudioFHFXAddSound() with an invalid fhfx.");
		}
	}
	__fhAudioObjController.fhfxList[$ fhfx].addSound(sound);
	return true;
}

/// @func fhAudioFHFXAddSound(fhfx, sound)
/// @desc Adds a sound sound(resource) to an fhfx
/// @param {string} fhfx Name of the fhfx to add a sound to
/// @returns {bool} reference Reference to the playing music
function fha_fhfx_add_sound(fhfx, sound)
{
	return fhAudioFHFXAddSound(fhfx, sound);
}