// feather ignore GM2017

/// @func fhAudioMusicSetLoopPoints(musicTrack, beginningTime, endingTime)
/// @desc Sets loop points for a music track
/// @param {Asset.GMSound} musicTrack Music to set loop points for
/// @param {real} beginningTime Time at which the intro ends and the loop starts (in milliseconds)
/// @param {real} endingTime Time at which the loop ends (in milliseconds)
/// @returns {bool} true Always returns True
function fhAudioMusicSetLoopPoints(musicTrack, beginningTime, endingTime = 0)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioMusicSetLoopPoints()");
		__fhAudioAssertArgumentNotUndefined("fhAudioMusicSetLoopPoints()", "musicTrack", musicTrack);
		if(beginningTime < 0)
			__fhAudioThrowError("Called fhAudioMusicSetLoopPoints() with a negative beginning time.");
		if(endingTime < 0)
			__fhAudioThrowError("Called fhAudioMusicSetLoopPoints() with a negative ending time.");
	}
	__fhAudioObjController.musicLoopPoints[$ string(musicTrack)] = new __fhAudioMusicLoopPoints(beginningTime, endingTime);
	return true;
}

/// @func fha_music_set_loop_points(musicTrack, beginningTime, endingTime)
/// @desc Sets loop points for a music track
/// @param {Asset.GMSound} musicTrack Music to set loop points for
/// @param {real} beginningTime Time at which the intro ends and the loop starts (in milliseconds)
/// @param {real} endingTime Time at which the loop ends (in milliseconds)
/// @returns {bool} true Always returns True
function fha_music_set_loop_points(musicTrack, beginningTime, endingTime = 0)
{
	return fhAudioMusicSetLoopPoints(musicTrack, beginningTime, endingTime);
}