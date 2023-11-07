// feather ignore GM2017
// feather ignore GM1045

/// @func fhAudioMusicGetReference()
/// @desc Gets the reference to the currently playing music
/// @returns {Id.Sound} reference Reference to the playing music
function fhAudioMusicGetReference()
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioMusicGetReference()");
	}
	return __fhAudioObjController.currentMusicRef;
}

/// @func fha_music_get_reference()
/// @desc Gets the reference to the currently playing music
/// @returns {Id.Sound} reference Reference to the playing music
function fha_music_get_reference()
{
	return fhAudioMusicGetReference();
}