// feather ignore GM2017

/// @func fhAudioIsInitialized()
/// @desc Checks if fhAudio is already initialized
/// @returns {bool} result Returns True if fhAudio is initialized, False if not
function fhAudioIsInitialized()
{
	if(instance_exists(__fhAudioObjController))
		return true;
	return false;
}

/// @func fha_is_initialized()
/// @desc Checks if fhAudio is already initialized
/// @returns {bool} result Returns True if fhAudio is initialized, False if not
function fha_is_initialized()
{
	return fhAudioIsInitialized();
}