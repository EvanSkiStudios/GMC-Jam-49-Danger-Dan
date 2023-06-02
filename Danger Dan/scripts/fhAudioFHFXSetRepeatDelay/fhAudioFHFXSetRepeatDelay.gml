// feather ignore GM2017

/// @func fhAudioFHFXSetRepeatDelay(fhfx, delay)
/// @desc Sets the repetition delay of a previously created fhfx
/// @param {string} fhfx The name of the fhfx to set the volume variance for
/// @param {real} delay How much delay between repetitions to set
/// @returns {bool} true Always returns True
function fhAudioFHFXSetRepeatDelay(fhfx, delay)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioFHFXSetRepeatDelay()");
		__fhAudioAssertArgumentNotUndefined("fhAudioFHFXSetRepeatDelay()", "fhfx", fhfx);
		__fhAudioAssertArgumentNotUndefined("fhAudioFHFXSetRepeatDelay()", "delay", delay);
		if(!is_string(fhfx))
			__fhAudioThrowError("Called fhAudioFHFXSetRepeatDelay() with an invalid fhfx.");
		if(__fhAudioObjController.soundList[$ fhfx] == undefined)
		{
			__fhAudioThrowError("Called fhAudioFHFXSetRepeatDelay() with an invalid fhfx.");
		}
	}
	__fhAudioObjController.soundList[$ fhfx].setRepeatDelay(delay);
	return true;
}

/// @func fha_fhfx_set_repeat_delay(fhfx, delay)
/// @desc Sets the repetition delay of a previously created fhfx
/// @param {string} fhfx The name of the fhfx to set the volume variance for
/// @param {real} delay How much delay between repetitions to set
/// @returns {bool} true Always returns True
function fha_fhfx_set_repeat_delay(fhfx, delay)
{
	return fhAudioFHFXSetRepeatDelay(fhfx, delay);
}