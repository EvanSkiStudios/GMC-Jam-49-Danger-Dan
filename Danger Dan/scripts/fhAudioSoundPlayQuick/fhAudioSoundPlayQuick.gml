// feather ignore GM2017

/// @func fhAudioSoundPlayQuick(sounds, _looped = false, _pitchVariance = 0, _volumeVariance = 0)
/// @desc Plays a sound with random pitch and volume variation, either one or one of a group
/// @param {asset.gmsound|array<asset.gmsound>} sounds Single sound or array of sounds to choose from
/// @param {bool} _looped True to loop the sound, false if not
/// @param {real} _pitchVariance Amount to vary the pitch by
/// @param {real} _volumeVariance Amount to vary the volume by
/// @returns {Id.Sound} reference Reference to the playing sound
function fhAudioSoundPlayQuick(sounds, _looped = false, _pitchVariance = 0, _volumeVariance = 0)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlayQuick()", "sounds", sounds);
		if(is_array(sounds))
		{
			for(var i = 0; i < array_length(sounds)-1; i++)
			{
				if(audio_get_name(sounds[i])==undefined)
				{
					__fhAudioThrowError("Called fhAudioSoundPlayQuick() with an invalid value in the sounds variable array argument, must only be a sound asset or an array of sound assets.");
				}
			}
		}
		else
		{
			if(audio_get_name(sounds)==undefined)
			{
				__fhAudioThrowError("Called fhAudioSoundPlayQuick() with an invalid value in the sounds argument, must only be a sound asset or an array of sound assets.");
			}
		}
		if(_looped != true && _looped != false)
		{
			__fhAudioThrowError("Called fhAudioSoundPlayQuick() with an invalid loop argument, must be true or false.");
		}
	}
	var soundToPlay;
	if(is_array(sounds))
	{
		var index = irandom_range(0, array_length(sounds)-1);
		soundToPlay = sounds[index];
	}
	else
	{
		soundToPlay = sounds;
	}
	var pitch = random_range(1 - _pitchVariance, 1 + _pitchVariance);
	var volume = random_range(1 - _volumeVariance, 1 + _pitchVariance);
	var ref = audio_play_sound(soundToPlay, 1, _looped, volume, 0, pitch);
	return ref;
}

/// @func fha_sound_play_quick(sounds, _looped = false, _pitchVariance = 0, _volumeVariance = 0)
/// @desc Plays a sound with random pitch and volume variation, either one or one of a group
/// @param {asset.gmsound|array<asset.gmsound>} sounds Single sound or array of sounds to choose from
/// @param {bool} _looped True to loop the sound, false if not
/// @param {real} _pitchVariance Amount to vary the pitch by
/// @param {real} _volumeVariance Amount to vary the volume by
/// @returns {Id.Sound} reference Reference to the playing sound
function fha_sound_play_quick(sounds, _looped = false, _pitchVariance = 0, _volumeVariance = 0)
{
	return fhAudioSoundPlayQuick(sounds, _looped, _pitchVariance, _volumeVariance);
}