// feather ignore GM2017

/// @func fhAudioFHFXCreate(name, _category = 0, _sounds = undefined, _pitchVariance = 0, _volumeVariance = 0, _behavior = FHAUDIO_CHOOSE_RANDOM)
/// @desc Creates a new fhfx
/// @param {string} name The name to assign to the new fhfx
/// @param {real} _category Which category to which the new fhfx belongs to
/// @param {Asset.GMSound|Array.Asset.GMSound} _sounds Sound resource or array of sound resources to add to the new fhfx
/// @param {real} _pitchVariance How much pitch variance to set for the new fhfx
/// @param {real} _volumeVariance How much volume variance to set for the new fhfx
/// @param {real} _behavior Which behavior to assign to the new fhfx
/// @returns {bool} true Always returns True
function fhAudioFHFXCreate(name, _category = 0, _sounds = undefined, _pitchVariance = 0, _volumeVariance = 0, _behavior = FHAUDIO_CHOOSE_RANDOM)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioFHFXCreate()");
		if(!is_string(name))
			__fhAudioThrowError("Called fhAudioFHFXCreate() with a non-string name argument.");
		if(_sounds!=undefined)
		{
			if(is_array(_sounds))
			{
				for(var i = 0; i < array_length(_sounds)-1; i++)
				{
					if(audio_get_name(_sounds[i])==undefined)
					{
						__fhAudioThrowError("Called fhAudioFHFXCreate() with an invalid value in the sounds variable array argument, must only be a sound asset or an array of sound assets.");
					}
				}
			}
			else
			{
				if(audio_get_name(_sounds)==undefined)
				{
					__fhAudioThrowError("Called fhAudioFHFXCreate() with an invalid value in the sounds argument, must only be a sound asset or an array of sound assets.");
				}
			}
		}
		if(_behavior != undefined)
		{
			if((_behavior != FHAUDIO_CHOOSE_RANDOM) &&
				(_behavior != FHAUDIO_CHOOSE_RANDOM_NOT_REPEATED) &&
				(_behavior!= FHAUDIO_CHOOSE_SEQUENCE))
			{
				__fhAudioThrowError("Called fhAudioFHFXCreate() with an invalid '_behavior' argument.");
			}
		}
	}
	if(FHAUDIO_DEBUGMODE)
	{
		if(_category >= FHAUDIO_NUMBER_SOUND_CATEGORIES)
		{
			__fhAudioThrowError("fhAudioFHFXSound() called with a non-existent category.");
		}
	}
	var newFHFX = new __fhAudioFHFX(_category);
	if(_sounds != undefined)
	{
		if(is_array(_sounds))
		{
			for(var i = 0; i < array_length(_sounds); i++)
			{
				newFHFX.addSound(_sounds[i]);
			}
		}
		else
			newFHFX.addSound(_sounds);
	}
	newFHFX.setPitchVariance(_pitchVariance);
	newFHFX.setVolumeVariance(_volumeVariance);
	newFHFX.setBehavior(_behavior);
	with(__fhAudioObjController)
	{
		fhfxList[$ name] = newFHFX;
		fhfxIndexList[fhfxNumber] = name;
		fhfxNumber++;
	}
	return true;
}

/// @func fha_fhfx_create(name, _category = 0, _sounds = undefined, _pitchVariance = 0, _volumeVariance = 0, _behavior = FHAUDIO_CHOOSE_RANDOM)
/// @desc Creates a new fhfx
/// @param {string} name The name to assign to the new fhfx
/// @param {real} _category Which category to which the new fhfx belongs to
/// @param {Asset.GMSound|Array.Asset.GMSound} _sounds Sound resource or array of sound resources to add to the new fhfx
/// @param {real} _pitchVariance How much pitch variance to set for the new fhfx
/// @param {real} _volumeVariance How much volume variance to set for the new fhfx
/// @param {real} _behavior Which behavior to assign to the new fhfx
/// @returns {bool} true Always returns True
function fha_fhfx_create(name, _category = 0, _sounds = undefined, _pitchVariance = 0, _volumeVariance = 0, _behavior = FHAUDIO_CHOOSE_RANDOM)
{
	return fhAudioFHFXCreate(name, _category, _sounds, _pitchVariance, _volumeVariance, _behavior);
}