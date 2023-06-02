// feather ignore GM2017

/// @func fhAudioVolumeMusicGet()
/// @returns {real} volume The current volume of music
function fhAudioVolumeMusicGet()
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioVolumeMusicGet()");
	}
	return __fhAudioObjController.musicVolume;
}

/// @func fha_volume_music_get()
/// @returns {real} volume The current volume of music
function fha_volume_music_get()
{
	return fhAudioVolumeMusicGet();
}