// Feather ignore GM2017

/// @func fhAudioEmitterSetInstanceToFollow(emitter, instanceToFollow, _followVelocity = false, _velocityMultiplier = 1, _followIn3d = false)
/// @desc Tells an emitter to follow an emitter automatically
/// @param {real} emitter The emitter
/// @param {ID.Instance} instanceToFollow The ID of the instance
/// @param {bool} _followVelocity True if it should also apply velocity from the instance
/// @param {real} _velocityMultiplier How much to multiply the velocity from the instance(if enabled)
/// @param {bool} _followIn3d True if it should also use the 'z' variable on the instance and follow in 3d space
/// @returns {bool} true Always returns True
function fhAudioEmitterSetInstanceToFollow(emitter, instanceToFollow, _followVelocity = false, _velocityMultiplier = 1, _followIn3d = false)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioEmitterSetInstanceToFollow()");
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetInstanceToFollow()", "emitter", emitter);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetInstanceToFollow()", "instanceToFollow", newInstanceToFollow);
		if(__fhAudioObjController.emitterMap[$ string(emitter)] == undefined)
			__fhAudioThrowError("Called fhAudioEmitterSetInstanceToFollow() with a non-existent emitter.");
		if(!instance_exists(instanceToFollow))
			__fhAudioThrowError("Called fhAudioEmitterSetInstanceToFollow() with a non-existent instance.");
	}
	__fhAudioObjController.emitterMap[$ string(emitter)].setFollowInstance(instanceToFollow, _followIn3d, _followVelocity, _velocityMultiplier);
	return true;
}

/// @func fha_emitter_set_instance_to_follow(emitter, instanceToFollow, _followVelocity = false, _velocityMultiplier = 1, _followIn3d = false)
/// @desc Tells an emitter to follow an emitter automatically
/// @param {real} emitter The emitter
/// @param {ID.Instance} instanceToFollow The ID of the instance
/// @param {bool} _followVelocity True if it should also apply velocity from the instance
/// @param {real} _velocityMultiplier How much to multiply the velocity from the instance(if enabled)
/// @param {bool} _followIn3d True if it should also use the 'z' variable on the instance and follow in 3d space
/// @returns {bool} true Always returns True
function fha_emitter_set_instance_to_follow(emitter, instanceToFollow, _followVelocity = false, _velocityMultiplier = 1, _followIn3d = false)
{
	return fhAudioEmitterSetInstanceToFollow(emitter, instanceToFollow, _followVelocity, _velocityMultiplier, _followIn3d);
}