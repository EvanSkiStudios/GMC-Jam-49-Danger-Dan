// Feather ignore GM2017

/// @func fhAudioListenerSetInstanceToFollow(instanceToFollow, _followVelocity = false, _velocityMultiplier = 1, _followOrientation = false, _followIn3d = false)
/// @desc Tells the audio listener to follow an instance
/// @param {ID.Instance} instanceToFollow The ID of the instance
/// @param {bool} _followVelocity True if it should also apply velocity from the instance
/// @param {real} _velocityMultiplier How much to multiply the velocity from the instance(if enabled)
/// @param {bool} _followOrientation True if it should follow
/// @param {bool} _followIn3d True if it should also use the 'z' variable on the instance and follow in 3d space
/// @returns {bool} true Always returns True
function fhAudioListenerSetInstanceToFollow(instanceToFollow, _followVelocity = false, _velocityMultiplier = 1, _followOrientation = false, _followIn3d = false)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioListenerSetInstanceToFollow()");
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetInstanceToFollow()", "instanceToFollow", instanceToFollow);
		if(!instance_exists(instanceToFollow))
			__fhAudioThrowError("Called fhAudioListenerSetInstanceToFollow() with a non-existant instance.");
	}
	with(__fhAudioObjController)
	{
		listenerInstanceToFollow = instanceToFollow;
		listenerInstanceToFollow3d = _followIn3d;
		listenerInstanceToFollowVelocity = _followVelocity;
		listenerVelocityMultiplier = _velocityMultiplier;
		listenerInstanceToFollowOrientation = _followOrientation;
	}
	return true;
}

/// @func fha_listener_set_instance_to_follow(instanceToFollow, _followVelocity = false, _velocityMultiplier = 1, _followOrientation = false, _followIn3d = false)
/// @desc Tells the audio listener to follow an instance
/// @param {ID.Instance} instanceToFollow The ID of the instance
/// @param {bool} _followVelocity True if it should also apply velocity from the instance
/// @param {real} _velocityMultiplier How much to multiply the velocity from the instance(if enabled)
/// @param {bool} _followOrientation True if it should follow
/// @param {bool} _followIn3d True if it should also use the 'z' variable on the instance and follow in 3d space
/// @returns {bool} true Always returns True
function fha_listener_set_instance_to_follow(instanceToFollow, _followVelocity = false, _velocityMultiplier = 1, _followOrientation = false, _followIn3d = false)
{
	return fhAudioListenerSetInstanceToFollow(instanceToFollow, _followVelocity, _velocityMultiplier, _followOrientation, _followIn3d);
}