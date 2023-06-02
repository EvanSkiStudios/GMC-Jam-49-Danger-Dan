// feather ignore GM2017

/// @func fhAudioFHFXSetVolumeVariance(fhfx, variance)
/// @desc Sets the volume variance of a previously created fhfx
/// @param {string} fhfx The name of the fhfx to set the volume variance for
/// @param {real} variance How much variance in volume to set
/// @returns {bool} true Always returns True
function fhAudioFHFXSetVolumeVariance(fhfx, variance)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioFHFXSetVolumeVariance()");
		__fhAudioAssertArgumentNotUndefined("fhAudioFHFXSetVolumeVariance()", "fhfx", fhfx);
		__fhAudioAssertArgumentNotUndefined("fhAudioFHFXSetVolumeVariance()", "variance", variance);
		if(!is_string(fhfx))
			__fhAudioThrowError("Called fhAudioFHFXSetVolumeVariance() with an invalid fhfx.");
		if(__fhAudioObjController.soundList[$ fhfx] == undefined)
		{
			__fhAudioThrowError("Called fhAudioFHFXSetVolumeVariance() with an invalid fhfx.");
		}
	}
	__fhAudioObjController.soundList[$ fhfx].setVolumeVariance(variance);
	return true;
}

/// @func fha_fhfx_set_volume_variance(fhfx, variance)
/// @desc Sets the volume variance of a previously created fhfx
/// @param {string} fhfx The name of the fhfx to set the volume variance for
/// @param {real} variance How much variance in volume to set
/// @returns {bool} true Always returns True
function fha_fhfx_set_volume_variance(fhfx, variance)
{
	return fhAudioFHFXSetVolumeVariance(fhfx, variance);
}