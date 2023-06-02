// feather ignore GM2017

/// @func fhAudioCategoryResume(category, _fadeTime = 1000)
/// @desc Resumes the sounds in the specified category, fading them in if specified
/// @param {real} category Category
/// @param {real} _fadeTime Time over which to fade in the sounds
/// @returns {bool} true Always returns True
function fhAudioCategoryResume(category, _fadeTime = 1000)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioCategoryResume()");
		__fhAudioAssertArgumentNotUndefined("fhAudioCategoryResume()", "category", category);
		if(category >= FHAUDIO_NUMBER_SOUND_CATEGORIES)
		{
			__fhAudioThrowError("fhAudioCategoryResume() called with a non-existent category.");
		}
		if(_fadeTime < 0)
			__fhAudioThrowError("Called fhAudioCategoryResume() with a negative fading time.");
	}
	with(__fhAudioObjController)
	{
		var array = variable_struct_get_names(playingSoundsMap);
		var size = array_length(array);
		for(var i = 0; i < size; i++)
		{
			if(playingSoundsMap[$ array[i]].myCategory == category)
			{
				__fhAudioSoundResume(playingSoundsMap[$ array[i]].mySound, _fadeTime);
			}
		}
	}
	return true;
}

/// @func fha_category_resume(category, _fadeTime = 1000)
/// @desc Resumes the sounds in the specified category, fading them in if specified
/// @param {real} category Category
/// @param {real} _fadeTime Time over which to fade in the sounds
/// @returns {bool} true Always returns True
function fha_category_resume(category, _fadeTime = 1000)
{
	return fhAudioCategoryResume(category, _fadeTime);
}