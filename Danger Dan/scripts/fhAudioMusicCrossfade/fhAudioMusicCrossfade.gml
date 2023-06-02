// feather ignore GM2017

/// @func fhAudioMusicCrossfade(musicTrack, _fadeTime = 1000, _fromBeginning = false)
/// @desc Crossfades the currently playing music with another one
/// @param {Asset.GMSound} musicTrack Music to crossfade to
/// @param {real} _fadeTime Time to take to perform the crossfade
/// @param {bool} _fromBeginning True plays the track from the beginning, false to continue where it left off
/// @returns {bool} true Always returns True
function fhAudioMusicCrossfade(musicTrack, _fadeTime = 1000, _fromBeginning = false)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioMusicCrossfade()");
		__fhAudioAssertArgumentNotUndefined("fhAudioMusicCrossfade()", "musicTrack", musicTrack);
		if(_fadeTime < 0)
			__fhAudioThrowError("Called fhAudioMusicCrossfade() with a negative fading time.");
	}
	with(__fhAudioObjController)
	{
		alarm[0] = 0;
		array_push(musicPendingFades, new __fhAudioFadeTask(musicTrack, _fadeTime, _fromBeginning));
	}
	return true;
}

/// @func fha_music_crossfade(musicTrack, _fadeTime = 1000, _fromBeginning = false)
/// @desc Crossfades the currently playing music with another one
/// @param {Asset.GMSound} musicTrack Music to crossfade to
/// @param {real} _fadeTime Time to take to perform the crossfade
/// @param {bool} _fromBeginning True plays the track from the beginning, false to continue where it left off
/// @returns {bool} true Always returns True
function fha_music_crossfade(musicTrack, _fadeTime = 1000, _fromBeginning = false)
{
	return fhAudioMusicCrossfade(musicTrack, _fadeTime, _fromBeginning);
}