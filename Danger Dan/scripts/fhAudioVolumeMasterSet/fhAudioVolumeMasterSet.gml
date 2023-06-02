// feather ignore GM2017

/// @func fhAudioVolumeMasterSet(newVolume, _time = 0)
/// @desc Sets the master volume of all audio
/// @param {real} newVolume Volume to set the audio to
/// @param {real} _time How long to take to fade the currently playing audio to the new volume
/// @returns {bool} true Always returns True
function fhAudioVolumeMasterSet(newVolume, _time = 0)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioVolumeMasterSet()");
		__fhAudioAssertArgumentNotUndefined("fhAudioVolumeMasterSet()", "newVolume", newVolume);
		if(_time != 0)
			if(_time < 0)
				__fhAudioThrowError("Called fhAudioVolumeMasterSet() with negative '_time' argument.");
		if(newVolume>1 || newVolume < 0)
		{
			__fhAudioThrowError("You called fhAudioVolumeMasterSet() with the volume parameter either below 0 or above 1.")
		}
	}
	with(__fhAudioObjController)
	{
		masterVolume = newVolume;
		setRealVolumes();
	}
	fhAudioVolumeMusicSet(__fhAudioObjController.musicVolume, _time);
	for(var i = 0; i < FHAUDIO_NUMBER_SOUND_CATEGORIES; i++)
	{
		fhAudioVolumeCategorySet(i, __fhAudioObjController.soundCategoryVolumes[i]);
	}
	if(FHAUDIO_AUTOSAVE_SETTINGS)
		__fhAudioSaveVolumes();
	return true;
}

/// @func fha_volume_master_set(newVolume, _time = 0)
/// @desc Sets the master volume of all audio
/// @param {real} newVolume Volume to set the audio to
/// @param {real} _time How long to take to fade the currently playing audio to the new volume
/// @returns {bool} true Always returns True
function fha_volume_master_set(newVolume, _time = 0)
{
	return fhAudioVolumeMasterSet(newVolume, _time);
}