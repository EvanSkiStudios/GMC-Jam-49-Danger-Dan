///feather ignore GM2017

function __fhAudioStoreMusicPos(faded)
{
	if(faded)
	{
		musicTrackPositions[$ string(fadingMusicTrack)] = audio_sound_get_track_position(fadingMusicRef);
	}
	else
	{
		if(currentMusicTrack != -1)
		{
			musicTrackPositions[$ string(currentMusicTrack)] = audio_sound_get_track_position(currentMusicRef);
		}
	}
}


function __fhAudioDoCrossFade(fadeTask)
{
	if(currentMusicTrack == fadeTask.myTargetMusic)
	{
		__fhAudioDebugLog("Attempted to crossfade to the same music track that is already playing.");
		return;
	}
	if(musicStatus == __FHAUDIO_STATUS_PLAYING)
	{
		fadingMusicTrack = currentMusicTrack;
		fadingMusicRef = currentMusicRef;
		audio_sound_gain(fadingMusicRef, 0, fadeTask.myTime);
		__fhAudioStoreMusicPos(true);
	}
	musicStatus = __FHAUDIO_STATUS_CROSSFADING;
	currentMusicTrack = fadeTask.myTargetMusic;
	lastMusicTrack = currentMusicTrack;
	if(!fadeTask.myFromBeginning)
	{
		if(musicTrackPositions[$ string(currentMusicTrack)] != undefined)
		{
			currentMusicRef = audio_play_sound(currentMusicTrack, 1, true, 0, musicTrackPositions[$ string(currentMusicTrack)]);
			variable_struct_remove(musicTrackPositions, string(currentMusicTrack));
		}
		else
			currentMusicRef = audio_play_sound(currentMusicTrack, 1, true, 0);
	}
	else
		currentMusicRef = audio_play_sound(currentMusicTrack, 1, true, 0);
	audio_sound_gain(currentMusicRef, realMusicVolume, fadeTask.myTime);
	fadeTimeEnd = current_time + fadeTask.myTime;
	var loopPoints = musicLoopPoints[$ string(currentMusicTrack)];
	if(loopPoints != undefined)
	{
		audio_sound_loop_start(currentMusicRef, loopPoints.beginningTime);
		audio_sound_loop_end(currentMusicRef, loopPoints.endingTime);
	}
}

function __fhAudioFadeTask(targetMusic, time, fromBeginning) constructor
{
	myTargetMusic = targetMusic;
	myTime = time;
	myFromBeginning = fromBeginning;
}

function __fhAudioStopFadedTrack()
{
	if(fadingMusicTrack != -1)
	{
		audio_stop_sound(fadingMusicRef);
		fadingMusicRef = -1;
		fadingMusicTrack = -1;
		fadeTimeEnd = -1;
	}
	musicStatus = __FHAUDIO_STATUS_PLAYING;
}

function __fhAudioMusicLoopPoints(newBeginningTime, newEndingTime) constructor
{
	beginningTime = newBeginningTime;
	endingTime = newEndingTime;
	loopLength = newEndingTime - newBeginningTime;
}