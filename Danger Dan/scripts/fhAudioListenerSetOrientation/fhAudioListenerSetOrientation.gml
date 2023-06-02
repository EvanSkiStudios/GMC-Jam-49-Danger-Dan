// Feather ignore GM2017

/// @func fhAudioListenerSetOrientation(newLookAtX, newLookAtY, newLookAtZ, newUpX, newUpY, newUpZ)
/// @desc Tells the audio listener what lookat and up directions to use
/// @param {real} newLookAtX The X component of the lookat vector
/// @param {real} newLookAtY The Y component of the lookat vector
/// @param {real} newLookAtZ The Z component of the lookat vector
/// @param {real} newUpX The X component of the up vector
/// @param {real} newUpY The Y component of the up vector
/// @param {real} newUpZ The Z component of the up vector
/// @returns {bool} true Always returns True
function fhAudioListenerSetOrientation(newLookAtX, newLookAtY, newLookAtZ, newUpX, newUpY, newUpZ)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioListenerSetOrientation()");
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetOrientation()", "newLookAtX", newLookAtX);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetOrientation()", "newLookAtY", newLookAtY);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetOrientation()", "newLookAtZ", newLookAtZ);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetOrientation()", "newUpX", newUpX);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetOrientation()", "newUpY", newUpY);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetOrientation()", "newUpZ", newUpZ);
		if((__fhAudioObjController.listenerInstanceToFollow != -1) &&
			(__fhAudioObjController.listenerInstanceToFollowOrientation))
		{
			__fhAudioThrowError("Called fhAudioListenerSetOrientation() while listener is set to follow an instance's orientation.");
		}
	}
	with(__fhAudioObjController)
	{
		listenerCurrentLookAtX = newLookAtX;
		listenerCurrentLookAtY = newLookAtY;
		listenerCurrentLookAtZ = newLookAtZ;
		listenerCurrentUpX = newUpX;
		listenerCurrentUpY = newUpY;
		listenerCurrentUpZ = newUpZ;
		audio_listener_orientation(listenerCurrentLookAtX, listenerCurrentLookAtY, listenerCurrentLookAtZ, listenerCurrentUpX, listenerCurrentUpY, listenerCurrentUpZ);
	}
	return true;
}

/// @func fha_listener_set_orientation(newLookAtX, newLookAtY, newLookAtZ, newUpX, newUpY, newUpZ)
/// @desc Tells the audio listener what lookat and up directions to use
/// @param {real} newLookAtX The X component of the lookat vector
/// @param {real} newLookAtY The Y component of the lookat vector
/// @param {real} newLookAtZ The Z component of the lookat vector
/// @param {real} newUpX The X component of the up vector
/// @param {real} newUpY The Y component of the up vector
/// @param {real} newUpZ The Z component of the up vector
function fha_listener_set_orientation(newLookAtX, newLookAtY, newLookAtZ, newUpX, newUpY, newUpZ)
{
	return fhAudioListenerSetOrientation(newLookAtX, newLookAtY, newLookAtZ, newUpX, newUpY, newUpZ);
}