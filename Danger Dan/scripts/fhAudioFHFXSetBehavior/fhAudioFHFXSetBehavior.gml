// feather ignore GM2017

/// @func fhAudioFHFXSetBehavior(fhfx, behavior)
/// @desc Sets the behavior of a previously created fhfx
/// @param {string} fhfx The name of the fhfx to set the behavior for
/// @param {real} behavior Which behavior to set the fhfx to use
/// @returns {bool} true Always returns True
function fhAudioFHFXSetBehavior(fhfx, behavior)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioFHFXSetBehavior()");
		__fhAudioAssertArgumentNotUndefined("fhAudioFHFXSetBehavior()", "fhfx", fhfx);
		__fhAudioAssertArgumentNotUndefined("fhAudioFHFXSetBehavior()", "behavior", behavior);
		if(!is_string(fhfx))
			__fhAudioThrowError("Called fhAudioFHFXSetBehavior() with an invalid fhfx.");
		if(__fhAudioObjController.fhfxList[$ fhfx] == undefined)
		{
			__fhAudioThrowError("Called fhAudioFHFXSetBehavior() with an invalid fhfx.");
		}
		if(behavior > (__FHAUDIO_NUM_CHOOSE_BEHAVIORS - 1))
		{
			__fhAudioThrowError("Called fhAudioFHFXSetBehavior() with an invalid behavior argument.");
		}
	}
	__fhAudioObjController.fhfxList[$ fhfx].setBehavior(behavior);
	return true;
}

/// @func fha_fhfx_set_behavior(fhfx, behavior)
/// @desc Sets the behavior of a previously created fhfx
/// @param {string} fhfx The name of the fhfx to set the behavior for
/// @param {real} behavior Which behavior to set the fhfx to use
/// @returns {bool} true Always returns True
function fha_fhfx_set_behavior(fhfx, behavior)
{
	return fhAudioFHFXSetBehavior(fhfx, behavior);
}