// feather ignore GM2017

/// @func fhAudioVolumeCategoryGet(category)
/// @param {real} category The category to get the volume for
/// @returns {real} volume The current volume of the specified category
function fhAudioVolumeCategoryGet(category)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioVolumeCategoryGet()");
		__fhAudioAssertArgumentNotUndefined("fhAudioVolumeCategoryGet()", "category", category);
		if(category >= FHAUDIO_NUMBER_SOUND_CATEGORIES)
		{
			__fhAudioThrowError("fhAudioVolumeCategoryGet() called with a non-existent category.");
		}
	}
	return __fhAudioGetCategoryVolume(category);
}

/// @func fha_volume_category_get(category)
/// @param {real} category The category to get the volume for
/// @returns {real} volume The current volume of the specified category
function fha_volume_category_get(category)
{
	return fhAudioVolumeCategoryGet(category);
}