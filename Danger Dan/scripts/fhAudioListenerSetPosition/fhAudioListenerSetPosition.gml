// feather ignore GM2017

/// @func fhAudioListenerSetPosition(newPosX, newPosY, _newPosZ = 0)
/// @desc Tells the audio listener what position to be at
/// @param {real} newPosX The X component of the position vector
/// @param {real} newPosY The Y component of the position vector
/// @param {real} _newPosZ The Z component of the position vector
/// @returns {bool} true Always returns True
function fhAudioListenerSetPosition(newPosX, newPosY, _newPosZ = 0)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioListenerSetPosition()");
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetPosition()", "newPosX", newPosX);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetPosition()", "newPosY", newPosY);
		if(__fhAudioObjController.listenerInstanceToFollow != noone)
			__fhAudioThrowError("Called fhAudioListenerSetPosition() while listener is set to follow an instance.");
	}
	audio_listener_position(newPosX, newPosY, _newPosZ);
	return true;
}

/// @func fha_listener_set_position(newPosX, newPosY, _newPosZ = 0)
/// @desc Tells the audio listener what position to be at
/// @param {real} newPosX The X component of the position vector
/// @param {real} newPosY The Y component of the position vector
/// @param {real} _newPosZ The Z component of the position vector
/// @returns {bool} true Always returns True
function fha_listener_set_position(newPosX, newPosY, _newPosZ = 0)
{
	return fhAudioListenerSetPosition(newPosX, newPosY, _newPosZ);
}