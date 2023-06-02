// feather ignore GM2017

/// @func fhAudioListenerSetUp(newUpX, newUpY, newUpZ)
/// @desc Tells the audio listener what direction is up
/// @param {real} newUpX The X component of the up vector
/// @param {real} newUpY The Y component of the up vector
/// @param {real} newUpZ The Z component of the up vector
/// @returns {bool} true Always returns True
function fhAudioListenerSetUp(newUpX, newUpY, newUpZ)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioListenerSetUp()");
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetUp()", "newUpX", newUpX);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetUp()", "newUpY", newUpY);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetUp()", "newUpZ", newUpZ);
		if((__fhAudioObjController.listenerInstanceToFollow != -1) &&
			(__fhAudioObjController.listenerInstanceToFollowOrientation))
		{
			__fhAudioThrowError("Called fhAudioListenerSetUp() while listener is set to follow an instance's orientation.");
		}
		
	}
	with(__fhAudioObjController)
	{
		listenerCurrentUpX = newUpX;
		listenerCurrentUpY = newUpY;
		listenerCurrentUpZ = newUpZ;
		audio_listener_orientation(listenerCurrentLookAtX, listenerCurrentLookAtY, listenerCurrentLookAtZ, listenerCurrentUpX, listenerCurrentUpY, listenerCurrentUpZ);
		
	}
	return true;
}

/// @func fha_listener_set_up(newUpX, newUpY, newUpZ)
/// @desc Tells the audio listener what direction is up
/// @param {real} newUpX The X component of the up vector
/// @param {real} newUpY The Y component of the up vector
/// @param {real} newUpZ The Z component of the up vector
/// @returns {bool} true Always returns True
function fha_listener_set_up(newUpX, newUpY, newUpZ)
{
	return fhAudioListenerSetUp(newUpX, newUpY, newUpZ);
}