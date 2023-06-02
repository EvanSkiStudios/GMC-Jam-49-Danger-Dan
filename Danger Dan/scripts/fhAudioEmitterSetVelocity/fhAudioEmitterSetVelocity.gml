// Feather ignore GM2017

/// @func fhAudioEmitterSetVelocity(emitter, newVelX, newVelY, _newVelZ = 0)
/// @desc Sets the velocity of an emitter
/// @param {real} emitter The emitter
/// @param {real} newVelX The X component of the velocity vector
/// @param {real} newVelY The Y component of the velocity vector
/// @param {real} _newVelZ The Z component of the velocity vector
/// @returns {bool} true Always returns True
function fhAudioEmitterSetVelocity(emitter, newVelX, newVelY, _newVelZ = 0)
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioEmitterSetVelocity()");
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetVelocity()", "emitter", emitter);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetVelocity()", "newVelX", newVelX);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetVelocity()", "newVelY", newVelY);
		if(__fhAudioObjController.emitterMap[$ string(emitter)] == undefined)
			__fhAudioThrowError("Called fhAudioEmitterSetVelocity() with a non-existent emitter.");
	}
	__fhAudioObjController.emitterMap[$ string(emitter)].setVelocity(newVelX, newVelY, _newVelZ);
	return true;
}

/// @func fha_emitter_set_velocity(emitter, newVelX, newVelY, _newVelZ = 0)
/// @desc Sets the velocity of an emitter
/// @param emitter The emitter
/// @param {real} newVelX The X component of the velocity vector
/// @param {real} newVelY The Y component of the velocity vector
/// @param {real} _newVelZ The Z component of the velocity vector
/// @returns {bool} true Always returns True
function fha_emitter_set_velocity(emitter, newVelX, newVelY, _newVelZ = 0)
{
	return fhAudioEmitterSetVelocity(emitter, newVelX, newVelY, _newVelZ);
}