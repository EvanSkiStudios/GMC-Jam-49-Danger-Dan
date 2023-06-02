// feather ignore GM2017

/// @func fhAudioActivate()
/// @desc Activates the fhAudio controller objects
/// @returns {bool} result Always returns true
function fhAudioActivate()
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioActivate()");
	}
	instance_activate_object(__fhAudioObjController);
	return true;
}

/// @func fha_activate()
/// @desc Activates the fhAudio controller objects
/// @returns {bool} result Always returns true
function fha_activate()
{
	return fhAudioActivate();
}