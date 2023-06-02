// feather ignore GM2017
// feather ignore GM1041

/// @func fhAudioMusicContinueLastTrack(_fromBeginning = false)
/// @desc Plays the previous played music track, stopping the current one
/// @param {bool} _fromBeginning True plays the track from the beginning, false to continue where it left off
/// @returns {Id.Sound} reference Reference to the playing music
function fhAudioMusicContinueLastTrack(_fromBeginning = false)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioContinueLastTrack()");
	}
	var returnValue = -1;
	with(__fhAudioObjController)
	{
		if(musicStatus != __FHAUDIO_STATUS_STOPPED)
		{
			__fhAudioDebugLog("Attempted to continue last track when music is already playing.");
			break;
		}
		if(lastMusicTrack == -1)
		{
			__fhAudioDebugLog("Attempted to continue last track when no music has been played yet.");
			break;
		}
		currentMusicTrack = lastMusicTrack;
		if(!_fromBeginning)
		{
			if(musicTrackPositions[$ string(currentMusicTrack)] != undefined)
			{
				currentMusicRef = audio_play_sound(currentMusicTrack, 1, true, realMusicVolume, musicTrackPositions[$ string(currentMusicTrack)]);
				variable_struct_remove(musicTrackPositions, string(currentMusicTrack));
			}
			else
				currentMusicRef = audio_play_sound(currentMusicTrack, 1, true, realMusicVolume);
		}
		else
		{
			currentMusicRef = audio_play_sound(currentMusicTrack, 1, true, realMusicVolume);
			if(musicTrackPositions[$ string(currentMusicTrack)] != undefined)
			{
				variable_struct_remove(musicTrackPositions, string(currentMusicTrack));
			}
		}
		musicStatus = __FHAUDIO_STATUS_PLAYING;
		returnValue = currentMusicRef;
	}
	return returnValue;
}

/// @func fha_music_continue_last_track(_fromBeginning = false)
/// @desc Plays the previous played music track, stopping the current one
/// @param {bool} _fromBeginning True plays the track from the beginning, false to continue where it left off
/// @returns {Id.Sound} reference Reference to the playing music
function fha_music_continue_last_track(_fromBeginning = false)
{
	return fhAudioMusicContinueLastTrack(_fromBeginning);
}