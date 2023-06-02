// feather ignore GM2017

/// @func fhAudioVolumeMasterGet()
/// @returns {real} volume The current master volume
function fhAudioVolumeMasterGet()
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioVolumeMasterGet()");
	}
	return __fhAudioObjController.masterVolume;
}

/// @func fha_volume_master_get()
/// @returns {real} volume The current master volume
function fha_volume_master_get()
{
	return fhAudioVolumeMasterGet();
}