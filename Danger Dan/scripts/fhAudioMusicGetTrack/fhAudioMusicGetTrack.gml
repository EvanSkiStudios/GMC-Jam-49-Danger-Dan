// Feather ignore GM2017
// Feather ignore GM1045

/// @func fhAudioMusicGetTrack()
/// @desc Gets the currently playing music track(resource tree constant)
/// @returns {Asset.GMSound} music Music track
function fhAudioMusicGetTrack()
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioMusicGetTrack()");
	}
	return __fhAudioObjController.currentMusicTrack;
}

/// @func fha_music_get_track()
/// @desc Gets the currently playing music track(resource tree constant)
/// @returns {Asset.GMSound} music Music track
function fha_music_get_track()
{
	return fhAudioMusicGetTrack();
}