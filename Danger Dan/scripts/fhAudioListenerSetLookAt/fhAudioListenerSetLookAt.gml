// feather ignore GM2017

/// @func fhAudioListenerSetLookAt(newLookAtX, newLookAtY, newLookAtZ)
/// @desc Tells the audio listener what direction to look
/// @param {real} newLookAtX The X component of the lookat vector
/// @param {real} newLookAtY The Y component of the lookat vector
/// @param {real} newLookAtZ The Z component of the lookat vector
/// @returns {bool} true Always returns True
function fhAudioListenerSetLookAt(newLookAtX, newLookAtY, newLookAtZ)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioListenerSetLookAt()");
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetLookAt()", "newLookAtX", newLookAtX);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetLookAt()", "newLookAtY", newLookAtY);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetLookAt()", "newLookAtZ", newLookAtZ);
		if((__fhAudioObjController.listenerInstanceToFollow != -1) &&
			(__fhAudioObjController.listenerInstanceToFollowOrientation))
		{
			__fhAudioThrowError("Called fhAudioListenerSetLookAt() while listener is set to follow an instance's orientation.");
		}
	}
	with(__fhAudioObjController)
	{
		listenerCurrentLookAtX = newLookAtX;
		listenerCurrentLookAtY = newLookAtY;
		listenerCurrentLookAtZ = newLookAtZ;
		audio_listener_orientation(listenerCurrentLookAtX, listenerCurrentLookAtY, listenerCurrentLookAtZ, listenerCurrentUpX, listenerCurrentUpY, listenerCurrentUpZ);
	}
	return true;
}

/// @func fha_listener_set_look_at(newLookAtX, newLookAtY, newLookAtZ)
/// @desc Tells the audio listener what direction to look
/// @param {real} newLookAtX The X component of the lookat vector
/// @param {real} newLookAtY The Y component of the lookat vector
/// @param {real} newLookAtZ The Z component of the lookat vector
/// @returns {bool} true Always returns True
function fha_listener_set_look_at(newLookAtX, newLookAtY, newLookAtZ)
{
	return fhAudioListenerSetLookAt(newLookAtX, newLookAtY, newLookAtZ);
}