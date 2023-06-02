// Feather ignore GM2017

/// @func fhAudioFHFXSetVolumeVariance(fhfx, variance)
/// @desc Sets the pitch variance of a previously created fhfx
/// @param {string} fhfx The name of the fhfx to set the pitch variance for
/// @param {real} variance How much variance in pitch to set
/// @returns {bool} true Always returns True
function fhAudioFHFXSetPitchVariance(fhfx, variance)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioFHFXSetPitchVariance()");
		__fhAudioAssertArgumentNotUndefined("fhAudioFHFXSetPitchVariance()", "fhfx", fhfx);
		__fhAudioAssertArgumentNotUndefined("fhAudioFHFXSetPitchVariance()", "variance", variance);
		if(!is_string(fhfx))
			__fhAudioThrowError("Called fhAudioFHFXSetPitchVariance() with an invalid sound.");
		if(__fhAudioObjController.fhfxList[$ fhfx] == undefined)
		{
			__fhAudioThrowError("Called fhAudioFHFXSetPitchVariance() with an invalid fhfx.");
		}
	}
	__fhAudioObjController.fhfxList[$ fhfx].setPitchVariance(variance);
	return true;
}

/// @func fha_fhfx_set_pitch_variance(fhfx, variance)
/// @desc Sets the pitch variance of a previously created fhfx
/// @param {string} fhfx The name of the fhfx to set the pitch variance for
/// @param {real} variance How much variance in pitch to set
/// @returns {bool} true Always returns True
function fha_fhfx_set_pitch_variance(fhfx, variance)
{
	return fhAudioFHFXSetPitchVariance(fhfx, variance);
}