// feather ignore GM2017

/// @func fhAudioListenerSetVelocity(newVelX, newVelY, _newVelZ = 0)
/// @desc Tells the audio listener what its velocity is
/// @param {real} newVelX The X component of the velocity vector
/// @param {real} newVelY The Y component of the velocity vector
/// @param {real} _newVelZ The Z component of the velocity vector
/// @returns {bool} true Always returns True
function fhAudioListenerSetVelocity(newVelX, newVelY, _newVelZ = 0)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioListenerSetVelocity()");
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetVelocity()", "newVelX", newVelX);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetVelocity()", "newVelY", newVelY);
		if(__fhAudioObjController.listenerInstanceToFollow != -1 || __fhAudioObjController.listenerInstanceToFollowVelocity)
		{
			__fhAudioThrowError("Called fhAudioListenerSetVelocity() while listener is set to follow an instance's velocity.");
		}
	}
	audio_listener_velocity(newVelX, newVelY, _newVelZ);
	return true;
}

/// @func fha_listener_set_velocity(newVelX, newVelY, _newVelZ = 0)
/// @desc Tells the audio listener what its velocity is
/// @param {real} newVelX The X component of the velocity vector
/// @param {real} newVelY The Y component of the velocity vector
/// @param {real} _newVelZ The Z component of the velocity vector
/// @returns {bool} true Always returns True
function fha_listener_set_velocity(newVelX, newVelY, _newVelZ = 0)
{
	return fhAudioListenerSetVelocity(newVelX, newVelY, _newVelZ);
}